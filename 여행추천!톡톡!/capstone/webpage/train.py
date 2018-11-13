import tensorflow as tf
import math
import os
import random
from embedding import Embedded
from seq2seq import Seq2Seq

def train(embedded, batch_size=100, epoch=100):
    model = Seq2Seq(embedded.voca_size)

    with tf.Session() as sess:
        checkpoint = tf.train.get_checkpoint_state("./model")

        if checkpoint and tf.train.checkpoint_exists(checkpoint.model_checkpoint_path):
            print("모델을 읽는 중", checkpoint.model_checkpoint_path)
            model.saver.restore(sess, checkpoint.model_checkpoint_path)
        else:
            print("새로운 모델을 생성")
            sess.run(tf.global_variables_initializer())

        writer = tf.summary.FileWriter("./logs", sess.graph)
        total_batch = int(math.ceil(len(embedded.test)/float(batch_size)))

        for step in range(total_batch * epoch):
            enc_input, dec_input, targets = embedded.batch(batch_size)
            _, loss = model.train(sess, enc_input, dec_input, targets)

            if (step + 1) % 100 == 0:
                model.write_logs(sess, writer, enc_input, dec_input, targets)
                print('Step:', '%06d' % model.global_step.eval(), 'cost =', '{:.6f}'.format(loss))

        checkpoint_path = os.path.join("./model", "conversation.ckpt")
        model.saver.save(sess, checkpoint_path, global_step=model.global_step)

    print('완료')

def test(embedded, batch_size=100):
    print("예측 테스트")
    model = Seq2Seq(embedded.voca_size)

    with tf.Session() as sess:
        ckpt = tf.train.get_checkpoint_state("./model")
        model.saver.restore(sess, ckpt.model_checkpoint_path)
        enc_input, dec_input, targets = embedded.batch(batch_size)
        expect, outputs, accuracy = model.test(sess, enc_input, dec_input, targets)
        expect = embedded.decode(expect)
        outputs = embedded.decode(outputs)
        pick = random.randrange(0, len(expect) / 2)
        input = embedded.decode([embedded.test[pick * 2]], True)
        expect = embedded.decode([embedded.test[pick * 2 + 1]], True)
        outputs = embedded.cut_eos(outputs[pick])

        print("\n정확도:", accuracy)
        print("랜덤 결과\n")
        print("입력값:", input)
        print("실제값:", expect)
        print("예측값:", ' '.join(outputs))

def main(_):
    embedded = Embedded()

    embedded.load_vaca("./data/chat.voc")
    embedded.load_exam("./data/chat.log")

    test(embedded, batch_size=100) #테스트하기
if __name__ == "__main__":
    tf.app.run()
