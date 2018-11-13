import tensorflow as tf
import numpy as np
import re

class Embedded:
    PAD_ID = 0
    GO_ID = 1
    EOS_ID = 2
    UNK_ID = 3

    predict = [PAD_ID, GO_ID, EOS_ID, UNK_ID]

    def __init__(self):
        self.voca_list = []
        self.voca_dict = {}
        self.voca_size = 0
        self.test = []
        self.index_epoc = 0

    def build_vaca(self, data, voca): #단어 만들기
        with open(data, "r", encoding="utf-8") as data_file:
            datas = data_file.read()
            words = self.tokenizer(datas)
            words = list(set(words)) #리스트 안에 중복 부분 제거

        with open(voca, "w", encoding="utf-8") as voca_file:
            for w in words:
                voca_file.write(w + "\n")

    def tokenizer(self, datas):
        words = []
        token_split = re.compile("([,!\"';)(])") #단어에 포함된 특수문자 구분

        for word in datas.strip().split():
            words.extend(token_split.split(word))

        return [w for w in words if w]

    def load_exam(self, data):
        self.test = []

        with open(data, "r", encoding="utf-8") as data_file:
            for d in data_file:
                token = self.tokenizer(d.strip()) #양쪽 공백제거
                id = self.token_id(token)
                self.test.append(id)

    def token_id(self, token):
        id = []

        for t in token:
            if t in self.voca_dict:
                id.append(self.voca_dict[t])
            else:
                id.append(self.UNK_ID)

        return id

    def id_token(self, id):
        token = []

        for i in id:
            token.append(self.voca_list[i])

        return token

    def cut_eos(self, indices):
        eos_idx = indices.index(self.EOS_ID)

        return indices[:eos_idx]

    def load_vaca(self, voca):
        self.voca_list = self.predict + []

        with open(voca, "r", encoding="utf-8") as voca_file:
            for v in voca_file:
                self.voca_list.append(v.strip())

        self.voca_dict = {n: i for i, n in enumerate(self.voca_list)} #단어사전 만들기
        self.voca_size = len(self.voca_list)

    def decode(self, index, string=False):
        token = [[self.voca_list[i] for i in d] for d in index]

        if string:
            #text = " ".join(token[0])
            #return text.strip()
            return self.decode_string(token[0])
        else:
            return token

    def decode_string(self, token):
        text = ' '.join(token)

        return text.strip()

    def eos(self, id):
        return id == self.EOS_ID

    def define(self, id):
        return id in self.predict

    def batch(self, size):
        encod_input = []
        decod_input = []
        target = []
        go = self.index_epoc

        if self.index_epoc+size < len(self.test)-1:
            self.index_epoc = self.index_epoc + size
        else :
            self.index_epoc = 0

        set_batch = self.test[go:go+size]
        set_batch = set_batch + set_batch[1:] + set_batch[0:1]

        max_input_length, max_output_length = self.max_length(set_batch)

        for i in range(0, len(set_batch)-1, 2):
            encode, decode, tar = self.transform(set_batch[i], set_batch[i+1], max_input_length, max_output_length)
            encod_input.append(encode)
            decod_input.append(decode)
            target.append(tar)

        return encod_input, decod_input, target

    def max_length(self, batch):
        max_input_length = 0
        max_output_length = 0

        for i in range(0, len(batch), 2):
            input_length = len(batch[i])
            output_length = len(batch[i+1])

            if input_length > max_input_length:
                max_input_length = input_length
            if output_length > max_output_length:
                max_output_length = output_length

        return max_input_length, max_output_length+1

    def transform(self, input, output, max_input, max_output):
        encode_input = self.pad(input, max_input)
        decode_input = self.pad(output, max_output, go=True)
        target = self.pad(output, max_output, eos=True)

        encode_input.reverse() #문장 반대로 삽입
        encode_input = np.eye(self.voca_size)[encode_input]
        decode_input = np.eye(self.voca_size)[decode_input]

        return encode_input, decode_input, target

    def pad(self, sequence, max_length, go=None, eos=None):
        if go:
            pad_sequence = [self.GO_ID] + sequence
        elif eos:
            pad_sequence = sequence + [self.EOS_ID]
        else:
            pad_sequence = sequence

        if len(pad_sequence) < max_length:
            return pad_sequence + ([self.PAD_ID] * (max_length - len(pad_sequence)))
        else:
            return pad_sequence

    def pad_left(self, sequence, max_length):
        if len(sequence) < max_length:
            return ([self.PAD_ID] * (max_length - len(sequence))) + sequence
        else:
            return sequence

def main(_):
    embedded = Embedded()

    print("어휘 사전 생성")
    embedded.build_vaca("./data/chat.log", "./data/chat.voc")

    print("어휘 사전 테스트")
    embedded.load_vaca("./data/chat.voc")
    print(embedded.voca_dict)

if __name__ == "__main__":
    tf.app.run()