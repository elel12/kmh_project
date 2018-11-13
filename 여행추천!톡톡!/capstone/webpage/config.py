import tensorflow as tf

tf.app.flags.DEFINE_string("train_dir", "webpage/model", "학습한 신경망을 저장할 폴더")
tf.app.flags.DEFINE_string("log_dir", "webpage/logs", "로그를 저장할 폴더")
tf.app.flags.DEFINE_string("ckpt_name", "conversation.ckpt", "체크포인트 파일명")

tf.app.flags.DEFINE_boolean("train", False, "학습")
tf.app.flags.DEFINE_boolean("test", True, "테스트")
tf.app.flags.DEFINE_boolean("data_loop", True, "작은 데이터 실험")
tf.app.flags.DEFINE_integer("batch_size", 100, "미니 배치 크기")
tf.app.flags.DEFINE_integer("epoch", 1000, "총 학습 반복 횟수")

tf.app.flags.DEFINE_string("data_path", "webpage/data/chat.log", "대화 파일 위치")
tf.app.flags.DEFINE_string("voc_path", "webpage/data/chat.voc", "어휘 사전 파일 위치")
tf.app.flags.DEFINE_boolean("voc_test", False, "어휘 사전 테스트")
tf.app.flags.DEFINE_boolean("voc_build", False, "어휘 사전 생성")

tf.app.flags.DEFINE_integer("max_decode_len", 20, "최대 디코더 셀 크기(최대 답변 크기)")


FLAGS = tf.app.flags.FLAGS
