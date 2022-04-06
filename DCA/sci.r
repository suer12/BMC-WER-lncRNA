source('stdca.r')


data = read.table('input.txt',header=T) 

stdca(probability = c(F,F,F,F)
      ,data=data
      ,outcome = 'fustat'
      ,ttoutcome = 'futime'
      ,timepoint = 12*3   #这里是设置时间点的地方
      ,predictors =c('age','stage', 'riskScore','nomogram')
      ,xstop=1  #这里可以设置X轴最大值
      ,smooth = F
      ,ymin=0)

