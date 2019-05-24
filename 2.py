import speech_recognition as sr
 
# obtain path to "english.wav" in the same folder as this script
from os import path
AUDIO_FILE = "/home/sunny/check/test.wav"
# AUDIO_FILE = path.join(path.dirname(path.realpath(__file__)), "french.aiff")
# AUDIO_FILE = path.join(path.dirname(path.realpath(__file__)), "chinese.flac")
print("hello")
# use the audio file as the audio source
r = sr.Recognizer()
with sr.AudioFile(AUDIO_FILE) as source:
	print("1stage")    
	audio = r.record(source)  # read the entire audio file
 
# recognize speech using Sphinx
try:
    x = r.recognize_sphinx(audio)
    print(r.recognize_sphinx(audio))
    f= open("abc.txt","w+")
    f.write(x)	 
except sr.UnknownValueError:
    print("Sphinx could not understand audio")
except sr.RequestError as e:
    print("Sphinx error; {0}".format(e))
