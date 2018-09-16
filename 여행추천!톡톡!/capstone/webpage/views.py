from django.views import View
from django.shortcuts import render
from .models import acc_search
from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.core.mail import EmailMessage
import random, math
import numpy as np
import tensorflow as tf
from .seq2seq import Seq2Seq
from django.http import HttpResponse
import json
from .embedding import Embedded

# Create your views here.

def main_page(request):
    return render(request, 'webtemplates/main_page.html')

def signup_acc(request):                                    #가입 페이지
    return render(request, 'webtemplates/signup.html')

class Join_Acc(View):                                       #가입하기
    def get(self, request, *args, **kwargs):
        return render(request, 'webtemplates/error_page.html')

    def post(self, request, *args, **kwargs):
        condition = False

        createID = request.POST['id']
        createPW = request.POST['password']
        createMail = request.POST['mail']
        createFname = request.POST['f_name']
        createLname = request.POST['l_name']

        try:
            User.objects.get(username=createID)
            condition = True
        except ObjectDoesNotExist:
            condition = False

        if not condition:
            user = User.objects.create_user(createID, createMail, createPW)
            user.first_name = createFname
            user.last_name = createLname
            user.save()
            return render(request, 'webtemplates/acc_comp.html')
        else:
            return render(request, 'webtemplates/error_page.html')

def login_acc(request):
    if request.method == "POST":
        userID = request.POST.get('uid')
        userPW = request.POST.get('upw')
        user = authenticate(username=userID, password=userPW)

        if user:
            login(request, user)
            return redirect('main_page')
        else:
            return render(request, 'webtemplates/error_page.html')

def logout_acc(request):
    logout(request)
    return redirect('main_page')

def delete(request):
    return render(request, 'webtemplates/delete_acc.html')

class Delete_acc(View):                      #탈퇴하기
    def get(self, request, *args, **kwargs):
        return render(request, 'webtemplates/error_page.html')

    def post(self, request, *args, **kwargs):
        deleteID = request.POST['id']
        deletePW = request.POST['password']
        deleteMail = request.POST['mail']

        user = authenticate(username=deleteID, password=deletePW)
        d_user = User.objects.get(username=deleteID)
        if d_user.email == deleteMail:
            User.objects.get(username=deleteID).delete()
            return render(request, 'webtemplates/delete_comp.html')
        else:
            return render(request, 'webtemplates/error_page.html')

def find_acc(request):                         #비밀번호 찾기 페이지
    return render(request, 'webtemplates/find_pw.html')

class Find_Acc(View):                        #비밀번호 찾기
    def get(self, request, *args, **kwargs):
        return render(request, 'webtemplates/error_page.html')

    def post(self, request, *args, **kwargs):
        findID = request.POST['id']
        findF_name = request.POST['f_name']
        findL_name = request.POST['l_name']
        findMail = request.POST['mail']
        f_user = User.objects.get(username=findID)

        if f_user.first_name == findF_name and f_user.last_name == findL_name and f_user.email == findMail:
            pw_char = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
                        'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
                        'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
            pw = []
            for i in range(8):
                if i%2 == 0:
                    pw.append(random.choice(pw_char))
                else :
                    pw.append(str(random.randint(0, 9)))
            f_pw = ''.join(pw)
            change_pass = User.objects.get(username=findID)
            change_pass.set_password(f_pw)
            change_pass.save()
            user = authenticate(username=findID, password=f_pw)

            if user:
                email = EmailMessage('임시 비밀번호', f_pw, to=[findMail])
                email.send()
                return render(request, 'webtemplates/find_comp.html')
            else:
                return render(request, 'webtemplates/error_page.html')

def make_rpl(request):
    sentence = request.GET['text']
    embedded = Embedded()
    embedded.load_vaca("webpage/data/chat.voc")
    model = Seq2Seq(embedded.voca_size)
    sess = tf.Session()
    checkpoint = tf.train.get_checkpoint_state("webpage/model")
    model.saver.restore(sess, checkpoint.model_checkpoint_path)
    encode_input = embedded.tokenizer(sentence)
    encode_input = embedded.token_id(encode_input)
    decode_input = []
    sequence = 0

    def decoding(encode_input, decode_input):
        if type(decode_input) is np.ndarray:
            decode_input = decode_input.tolist()
        input_len = int(math.ceil((len(encode_input) + 1) * 1.5))
        encode_input, decode_input, _ = embedded.transform(encode_input, decode_input, input_len, 20)

        return model.predict(sess, [encode_input], [decode_input])

    for i in range(0, 20, 1):
        outputs = decoding(encode_input, decode_input)
        if embedded.eos(outputs[0][sequence]):
            break
        elif embedded.define(outputs[0][sequence]) is not True:
            decode_input.append(outputs[0][sequence])
            sequence += 1
    reply = embedded.decode([decode_input], True)

    if request.user.is_authenticated:
        reply_list = [a for a in reply]
        if len(reply_list) > 3:
            reply_data = '{}{}{}{}'.format(reply_list[0], reply_list[1], reply_list[2], reply_list[3])

            if reply_data == "http":
                reply_link = "<a href=" + reply + " target='_blank'>" + reply + "</a>"
                data = acc_search(search_id=request.user, search_link=reply_link)
                data.save()

        return HttpResponse(reply)

def db_list(request):
    if request.user.is_authenticated:
        user = User.objects.get(username=request.user)
        db_user = user.acc_search_set.all()
        link_list = [db.search_link for db in db_user]
        return HttpResponse(json.dumps(link_list), content_type="application/json")
    else:
        return HttpResponse("")

def test_page(request):
    #if request.user.is_authenticated:
    #    user = User.objects.get(username=request.user)
    #    db_user = acc_search.objects.filter(search_id__in=[request.user])
    #    d_user = user.acc_search_set.all()
    #    data = [ d.search_link for d in db_user ]

    #db = "bye"
    #if request.user.is_authenticated:
    #    user = User.objects.get(username=request.user)
    #    db_user = acc_search.objects.filter(search_id__in=[request.user])
    #    db = "hello"
    #    response_data = serializers.serialize('json', db_user)
    data = "https://barbieone.blog.me/22122354"

    data_list = [ d for d in data]

    data2 = '{}{}{}{}'.format(data_list[0], data_list[1], data_list[2], data_list[3])
    if data2 == 'http':
        reply_link = "<a href=" + data + " target='_blank'>"+ data +"</a>"
    else:
        reply_link = "???"
    #return render(request, 'webtemplates/test_page.html', {'user': d_user})
    return HttpResponse(reply_link)