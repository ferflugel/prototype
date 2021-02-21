import io
import os
from PIL import Image, ImageDraw, ImageFont, ImageGrab
import keyboard
from google.cloud import vision
import time
import cv2

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = 'C:\\Users\\anann\\Desktop\\School\\CS\\uoftHacks-master\\webcamkey.json'

emotion_dict = {'UNKNOWN': 0, 'VERY_UNLIKELY': 1, 'UNLIKELY': 2, 'POSSIBLE': 3,
                       'LIKELY': 4, 'VERY_LIKELY': 5}
emotions = ['ANGER', 'JOY', 'SURPRISE', 'SORROW']
im1 = Image.open('C:\\Users\\anann\\Desktop\\School\\CS\\uoftHacks-master\\images\\emoji1.png')
im2 = Image.open('C:\\Users\\anann\\Desktop\\School\\CS\\uoftHacks-master\\images\\emoji2.png')
im3 = Image.open('C:\\Users\\anann\\Desktop\\School\\CS\\uoftHacks-master\\images\\emoji3.png')
im4 = Image.open('C:\\Users\\anann\\Desktop\\School\\CS\\uoftHacks-master\\images\\emoji4.png')

def detect_faces(path):
    face_list = []
    client = vision.ImageAnnotatorClient()

    with io.open(path, 'rb') as image_file:
        content = image_file.read()

    image = vision.Image(content=content)

    response = client.face_detection(image=image)
    faces = response.face_annotations

    likelihood_name = ('UNKNOWN', 'VERY_UNLIKELY', 'UNLIKELY', 'POSSIBLE',
                       'LIKELY', 'VERY_LIKELY')

    for face in faces:
        emotion_rank = []
        emotion_rank.append(emotion_dict[likelihood_name[face.anger_likelihood]])
        emotion_rank.append(emotion_dict[likelihood_name[face.joy_likelihood]])
        emotion_rank.append(emotion_dict[likelihood_name[face.surprise_likelihood]])
        emotion_rank.append(emotion_dict[likelihood_name[face.sorrow_likelihood]])
        face_list.append(emotions[emotion_rank.index(max(emotion_rank))])
        vertices = []
        for vertex in face.bounding_poly.vertices:
            vertices.append((vertex.x, vertex.y))
        face_list.append(vertices)

    bounding_boxes(face_list, path)

    if response.error.message:
        raise Exception(
            '{}\nFor more info on error messages, check: '
            'https://cloud.google.com/apis/design/errors'.format(
                response.error.message))

def bounding_boxes(vects, image_file):
    count = {}
    im = Image.open(image_file)
    try:
        width = vects[1][1][0] - vects[1][0][0]          
    except:
        width = 0
    draw = ImageDraw.Draw(im)
    fontsize = width//4
    font = ImageFont.truetype("arial.ttf", fontsize)
    for i in range(1, len(vects), 2):
        draw.line([
        vects[i][0][0], vects[i][0][1],
        vects[i][1][0], vects[i][1][1],
        vects[i][2][0], vects[i][2][1],
        vects[i][3][0], vects[i][3][1],
        vects[i][0][0], vects[i][0][1]], fill='red', width=3)
        draw.text((vects[i][0][0], vects[i][0][1]),vects[i-1], fill='white', font=font, stroke_width=2, stroke_fill='black')
    for i in range(0, len(vects), 2):
        if vects[i] in count.keys():
            count[vects[i]] += 1
        else:
            count[vects[i]] = 1
    v=list(count.values())
    k=list(count.keys())
    try:
        emoji = k[v.index(max(v))]
    except:
        emoji = ''
    if emoji == 'ANGER':
        im1.save('C:\\Users\\anann\\Desktop\\School\\CS\\uoftHacks-master\\images\\emoji.png', 'PNG')
    elif emoji == 'JOY':
        im2.save('C:\\Users\\anann\\Desktop\\School\\CS\\uoftHacks-master\\images\\emoji.png', 'PNG')
    elif emoji == 'SURPRISE':
        im3.save('C:\\Users\\anann\\Desktop\\School\\CS\\uoftHacks-master\\images\\emoji.png', 'PNG')
    elif emoji == 'SORROW':
        im4.save('C:\\Users\\anann\\Desktop\\School\\CS\\uoftHacks-master\\images\\emoji.png', 'PNG')
    im.save('C:\\Users\\anann\\Desktop\\School\\CS\\uoftHacks-master\\images\\emotions.png', 'PNG')
    im.close()

while True:
    if keyboard.is_pressed('x'):
        break
    else:
        cam = cv2.VideoCapture(0)
        retval, frame = cam.read()
        if retval != True:
            raise ValueError("Can't read frame")

        cv2.imwrite('input.png', frame)
        cv2.waitKey()
        detect_faces('input.png')
        time.sleep(1.5)