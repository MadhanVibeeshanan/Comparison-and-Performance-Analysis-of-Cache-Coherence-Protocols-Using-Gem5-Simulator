import m5
from m5.objects import *
 
alpha_suffix = '_base.mytest-m64'
 
#638.imagick
imagick = Process() #     : This used to be LiveProcess()
imagick.executable = 'imagick_s' + alpha_suffix
imagick.cmd = [imagick.executable]
 
#641.leela
leela = Process() #     : This used to be LiveProcess()
leela.executable = 'leela_s' + alpha_suffix
leela.cmd = [leela.executable] + ['--quiet','--mode', 'gtp']
leela.input = 'test.sgf'
 
#511.povray
povray = Process() #     : This used to be LiveProcess()
povray.executable = 'povray_r' + alpha_suffix
povray.cmd = [povray.executable] + ['SPEC-benchmark.ini']

#619.lbm
lbm = Process() #     : This used to be LiveProcess()
lbm.executable = 'lbm_s' + alpha_suffix
lbm.cmd = [lbm.executable] + ['lbm.in']

#473.exchange2
exchange2 = Process() #     : This used to be LiveProcess()
exchange2.executable = 'exchange2_s' + alpha_suffix
exchange2.cmd = [exchange2.executable] + ['exchange2.txt']

 

