# Create your views here.

from django.shortcuts import render
from django.http import JsonResponse
from django.views import View
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
import re

def keyboard(request):
    return JsonResponse({
        'type': 'buttons',
        'buttons': ['시작하기']
    })

count = 0
check_count = 0

@csrf_exempt
def message(request):
    global count
    global check_count
    message = ((request.body).decode('utf-8'))
    return_json_str = json.loads(message)
    return_str = return_json_str['content']

    s = re.compile('[/]')
    m = s.search(return_str)

    if m :
        ans_str = return_str.split('/')
        if int(ans_str[1]) < 20:
            ans_age = '아동'
        elif int(ans_str[1]) < 60 and int(ans_str[1]) >= 20 :
            ans_age = '성인'
        elif int(ans_str[1]) >= 60 :
            ans_age = '노인'

        return JsonResponse({
            'message': {'text': 'http://48c9ac76.ngrok.io/counsels/'+ ans_str[0] +'/'+ans_age+'/'+ans_str[2]+'/스트레스'}
        })

    if return_str == '시작하기':
        return JsonResponse({
            'message': {'text' : '어떤 문제로 오셨나요?'},
            'keyboard': {
                'type':'buttons',
                'buttons':['1. 스트레스', '2. 우울증', '3. 강박증', '4. 외상 후 스트레스', '5. 자살', '6. 기타']
            }
        })

    if return_str == '설문 체크 하기' :
        count = 0
        count += 1;
        return JsonResponse({
            'message': {'text': '쉽게 흥분한다.'},
            'keyboard': {
                'type': 'buttons',
                'buttons': ['예', '아니오']
            }
        })

    if return_str == '예' :
        if count == 1:
            check_count += 1
            count += 1
            return JsonResponse({
                'message': {'text': '일정 시간 동안 정신을 집중하는데 어려움이 있다.'},
                'keyboard': {
                    'type': 'buttons',
                    'buttons': ['예', '아니오']
                }
            })

        if count == 2:
            check_count += 1
            count += 1
            return JsonResponse({
                'message': {'text': '잠드는데 어려움이 있으며 밤중에 깨어나 안절부절 못할때가 많다.'},
                'keyboard': {
                    'type': 'buttons',
                    'buttons': ['예', '아니오']
                }
            })

        if count == 3:
            check_count += 1
            count += 1
            return JsonResponse({
                'message': {'text': '잦은 두통으로 고생한다.'},
                'keyboard': {
                    'type': 'buttons',
                    'buttons': ['예', '아니오']
                }
            })

        if count == 4:
            check_count += 1
            count += 1
            return JsonResponse({
                'message': {'text': '때때로 불안하여 잠이 오지 않는다.'},
                'keyboard': {
                    'type': 'buttons',
                    'buttons': ['예', '아니오']
                }
            })

        if count == 5:
            count = 0
            if check_count >= 4 :
                return JsonResponse({
                    'message': {'text': '당신은 정신질환으로 발전된 가능성이 높아진 상태입니다.'}
                })
            if check_count <= 3 and check_count > 1 :
                return JsonResponse({
                    'message': {'text': '이미 스트레스의 영향을 받기 시작된 것입니다. 스트레스 해소를 위한 나만의 방법을 찾아보시는건 어떨까요?'}
                })
            if check_count <= 1 :
                return JsonResponse({
                    'message': {'text': '당신은 정신 건강이 매우 양호한 상태입니다. 그래도 받아보시겠다면 '}
                })

    if return_str == '아니오' :
        if count == 1:
            count += 1
            return JsonResponse({
                'message': {'text': '일정 시간 동안 정신을 집중하는데 어려움이 있다.'},
                'keyboard': {
                    'type': 'buttons',
                    'buttons': ['예', '아니오']
                }
            })

        if count == 2:
            count += 1
            return JsonResponse({
                'message': {'text': '잠드는데 어려움이 있으며 밤중에 깨어나 안절부절 못할때가 많다.'},
                'keyboard': {
                    'type': 'buttons',
                    'buttons': ['예', '아니오']
                }
            })

        if count == 3:
            count += 1
            return JsonResponse({
                'message': {'text': '잦은 두통으로 고생한다.'},
                'keyboard': {
                    'type': 'buttons',
                    'buttons': ['예', '아니오']
                }
            })

        if count == 4:
            count += 1
            return JsonResponse({
                'message': {'text': '때때로 불안하여 잠이 오지 않는다.'},
                'keyboard': {
                    'type': 'buttons',
                    'buttons': ['예', '아니오']
                }
            })

        if count == 5:
            count = 0
            if check_count >= 4 :
                return JsonResponse({
                    'message': {'text': '당신은 정신질환으로 발전된 가능성이 높아진 상태입니다.'}
                })
            if check_count <= 3 and check_count > 1 :
                return JsonResponse({
                    'message': {'text': '이미 스트레스의 영향을 받기 시작된 것입니다. 스트레스 해소를 위한 나만의 방법을 찾아보시는건 어떨까요?'}
                })
            if check_count <= 1 :
                return JsonResponse({
                    'message': {'text': '당신은 정신 건강이 매우 양호한 상태입니다. 그래도 받아보시겠다면 '}
                })

    if return_str == '1. 스트레스':
        return JsonResponse({
            'message': {'text': '해당 설문지를 체크해주세요'},
            'keyboard': {
                'type': 'buttons',
                'buttons': ['설문 체크 하기']
            }
        })

    if return_str == '2. 우울증':
        return JsonResponse({
            'message': {'text': '해당 설문지를 체크해주세요'},
            'keyboard': {
                'type': 'buttons',
                'buttons': ['1. YES', '2. NO']
            }
        })

    if return_str == '3. 강박증':
        return JsonResponse({
            'message': {'text': '해당 설문지를 체크해주세요'},
            'keyboard': {
                'type': 'buttons',
                'buttons': ['수고']
            }
        })

    if return_str == '4. 외상 후 스트레스':
        return JsonResponse({
            'message': {'text': '해당 설문지를 체크해주세요'},
            'keyboard': {
                'type': 'buttons',
                'buttons': ['수고']
            }
        })

    if return_str == '5. 자살':
        return JsonResponse({
            'message': {'text': '해당 설문지를 체크해주세요'},
            'keyboard': {
                'type': 'buttons',
                'buttons': ['수고']
            }
        })

    if return_str == '6. 기타':
        return JsonResponse({
            'message': {'text': '어떤 상담을 원하시나요?'},
            'keyboard': {
                'type': 'buttons',
                'buttons': ['1. 개인 상담', '2. 집단 상담', '3. 상관 없음', '4. 원하지 않음']
            }
        })

    if return_str == '1. 개인 상담' or return_str == '2. 집단 상담' or return_str == '3. 상관 없음':
        return JsonResponse({
            'message': {'text': '지역/나이/성별 입력을 부탁드립니다'},
            'keyboard': {
                'type': 'text'
            }
        })

    if return_str == '4. 원하지 않음':
        return JsonResponse({
            'message': {'text': '행복하세요!'},
        })
    
    else :
        return JsonResponse({
            'message': {'text': '종료'},
        })

