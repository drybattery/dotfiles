# -*- coding: utf-8 -*-
"""
Created on Mon Jul 23 15:07:09 2018

@author: user
"""

from PIL import ImageFont, ImageDraw, Image
import numpy as np
import cv2
import glob
import shutil
import os
import sys

dir_name = input('選別するディレクトリを入力してください')
if os.path.exists(dir_name) == True:
    pass
else:
    sys.exit('ディレクトリ名が正しくないもしくは存在しません')


#def command(key):

movie_list = glob.glob(dir_name + "/*.MP4")
#a = glob.glob("movie/*.avi")
l = len(movie_list)
i = 0
dir_name_l = len(dir_name)

while(i >= 0 and l-1 >= i):
    cap = cv2.VideoCapture(movie_list[i])
    # 文字列取得と表示
    #STR = a[i][6:10]+a[i][11:15]
    #print(STR)
    STR = movie_list[i][int(dir_name_l)+1:int(dir_name_l)+5]+movie_list[i][int(dir_name_l)+6:int(dir_name_l)+10]
    #print(STR)
    if os.path.exists(dir_name+'/'+STR+'_晴昼'):
        pass
    else:
        os.mkdir(dir_name+'/'+STR+'_晴昼')
    if os.path.exists(dir_name+'/'+STR+'_晴夜'):
        pass
    else:
        os.mkdir(dir_name+'/'+STR+'_晴夜')
    if os.path.exists(dir_name+'/'+STR+'_雨昼'):
        pass
    else:
        os.mkdir(dir_name+'/'+STR+'_雨昼')
    if os.path.exists(dir_name+'/'+STR+'_雨夜'):
        pass
    else:
        os.mkdir(dir_name+'/'+STR+'_雨夜')
    if os.path.exists(dir_name+'/'+STR+'_ゴミ'):
        pass
    else:
        os.mkdir(dir_name+'/'+STR+'_ゴミ')


    count = cap.get(cv2.CAP_PROP_FRAME_COUNT)
    ms = 10
    #ms = video.get(cv2.CAP_PROP_FPS)
    while(cap.isOpened()):
        ret, frame = cap.read()
        # 最終フレーム到達でもう一度再生
        if ret == False:
            break


        #cv2.imshow('frame',frame)
        # 全体のフレームと現在のフレームの表示
        b,g,r,A = 0,0,0,0
        message = str(cap.get(cv2.CAP_PROP_POS_FRAMES))+'/'+str(count)
        # キー操作マニュアルの設定
        handle = 'キー操作一覧\nspace:一時停止\nb:再生\nn:3倍速\ng:戻る\nh:次へ\nj:先送り\nf:早戻し\nl:動画の終わり際にジャンプ\nv:初めから再生\n\n動画ファイルの仕分け先選択\nq:晴昼\nr:晴夜\nu:雨昼\np:雨夜\n]:使えないファイル'
        position = (10,40)
        cv2.putText(frame,message,position, cv2.FONT_HERSHEY_PLAIN, 3, (255,255,255), 3, cv2.LINE_AA)
        cv2.putText(frame,message,position, cv2.FONT_HERSHEY_PLAIN, 3, (b,g,r),2, cv2.LINE_AA)

        # キー操作マニュアルの表示
        font1 = ImageFont.truetype('TanukiMagic.ttf', 32)
        font2 = ImageFont.truetype('TanukiMagic.ttf', 32)
        image_pil = Image.fromarray(frame)#error
        draw = ImageDraw.Draw(image_pil)
        draw.text((1502,32),handle, font = font1, fill = (0,0,0))
        font = ImageFont.truetype('TanukiMagic.ttf', 32)
        draw.text((1500,30),handle, font = font2, fill = (200,200,200))
        frame = np.array(image_pil)

        cv2.imshow('frame', frame)

        cv2.moveWindow('frame', 0, 0)

        k = cv2.waitKey(ms)

        # 速度のリセット
        if k == ord('b'):
            ms = 10
        # 速度を3倍に
        if k == ord('n'):
            ms = 1

        # 一時停止
        if k == ord(' '):
            if ms == 0:
                ms = 10
            else:
                ms = 0
        # 何もせず戻る
        if k == ord('g'):
            i -= 1
            #print(i)
            break

        # 何もせず次へ
        if k == ord('h'):
            i += 1
            #print(i)
            break

        # 動画の先送り(何フレームか)
        if k == ord('j'):
            cap.set(cv2.CAP_PROP_POS_FRAMES, cap.get(cv2.CAP_PROP_POS_FRAMES)+1000)

       # 動画の巻き戻し(何フレームか)
        if k == ord('f'):
            cap.set(cv2.CAP_PROP_POS_FRAMES, cap.get(cv2.CAP_PROP_POS_FRAMES)-1000)

        # 動画のスキップ(最終フレーム付近)
        if k == ord('l'):
            cap.set(cv2.CAP_PROP_POS_FRAMES, cap.get(cv2.CAP_PROP_FRAME_COUNT)-100)

        # 晴昼
        if k == ord('q'):
            cap.release()
            cv2.destroyAllWindows()
            # テキストファイルに書き込み
            f = open('test.txt', 'a')
            f.write('晴昼 '+ os.path.basename(movie_list[i]) +'\n')
            f.close()
            shutil.move(movie_list[i], dir_name+'/'+STR+'_晴昼')
            movie_list.pop(i)
            l -= 1
            break

        # 晴夜
        if k == ord('r'):
            cap.release()
            cv2.destroyAllWindows()
            # テキストファイルに書き込み
            f = open('test.txt', 'a')
            f.write('晴夜 '+ os.path.basename(movie_list[i]) +'\n')
            f.close()
            shutil.move(movie_list[i], dir_name+'/'+STR+'_晴夜')
            movie_list.pop(i)
            l -= 1
            break
        # 雨昼
        if k == ord('u'):
            cap.release()
            cv2.destroyAllWindows()
            # テキストファイルに書き込み
            f = open('test.txt', 'a')
            f.write('雨昼 '+ os.path.basename(movie_list[i]) +'\n')
            f.close()
            shutil.move(movie_list[i], dir_name+'/'+STR+'_雨昼')
            movie_list.pop(i)
            l -= 1
            break

        # 雨夜
        if k == ord('p'):
            cap.release()
            cv2.destroyAllWindows()
            # テキストファイルに書き込み
            f = open('test.txt', 'a')
            f.write('雨夜 '+ os.path.basename(movie_list[i]) +'\n')
            f.close()
            shutil.move(movie_list[i], dir_name+'/'+STR+'_雨夜')
            movie_list.pop(i)
            l -= 1
            break

        # ゴミファイルの仕分け先
        if k == ord(']'):
            cap.release()
            cv2.destroyAllWindows()
            # テキストファイルに書き込み
            f = open('test.txt', 'a')
            f.write('雨夜 '+ os.path.basename(movie_list[i]) +'\n')
            f.close()
            shutil.move(movie_list[i], dir_name+'/'+STR+'_ゴミ')
            movie_list.pop(i)
            l -= 1
            break



        # 初めから再生
        if k == ord('v'):
            break

        # 最終フレーム到達でもう一度再生
        if ret == False:
            break

    cap.release()
    cv2.destroyAllWindows()

#dir_name内のファイルが存在しないディレクトリを全部消す
for dirpath, dirnames, filenames in os.walk(dir_name):
    for dr in dirnames:
        try:
            os.rmdir(dir_name + '/' + dr)
        except:
            print(dr)
#try:
#    os.removedirs(dir_name)
#except:
#    print("exist" + dir_name)

#print('i= '+str(i))
#print('l= '+str(l))
#print('movie_list= '+str(movie_list))

