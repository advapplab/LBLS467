#slide1
set.seed(1)
x = rnorm(1000,mean = 175,sd  =2)
hist(x,main = 'A Random Sample of Size 1000 on the height of 18-22 male adults')
text(x = 180, y = 200, paste('mean: ',toString(mean(x))))
text(x = 180, y = 175, paste('std: ',toString(sd(x))))

#t-distribution plot1
z = seq(-3.5,3.5,by=0.01)
plot(z,dt(z,999),type='l',main = 't-distribution, df = 999')
polygon(x = c(3.5,3.5,seq(3.5,1.96,by=-0.001),1.96,1.96),
        y = c(0,dt(3.5,999),dt(seq(3.5,1.96,by=-0.001),999),dt(1.96,999),0),
        density = 50,col = 'blue')

polygon(x = -c(3.5,3.5,seq(3.5,1.96,by=-0.001),1.96,1.96),
        y = c(0,dt(3.5,999),dt(seq(3.5,1.96,by=-0.001),999),dt(1.96,999),0),
        density = 50,col = 'blue')

#t-distribution plot2
plot(z,dt(z,999),type='l',main = 't-distribution, df = 999')
polygon(x = c(3.5,3.5,seq(3.5,1.96,by=-0.001),1.96,1.96),
        y = c(0,dt(3.5,999),dt(seq(3.5,1.96,by=-0.001),999),dt(1.96,999),0),
        density = 50,col = 'blue')

polygon(x = -c(3.5,3.5,seq(3.5,1.96,by=-0.001),1.96,1.96),
        y = c(0,dt(3.5,999),dt(seq(3.5,1.96,by=-0.001),999),dt(1.96,999),0),
        density = 50,col = 'blue')

polygon(x = c(3.5,3.5,seq(3.5,2.5,by=-0.001),2.5,2.5),
        y = c(0,dt(3.5,999),dt(seq(3.5,2.5,by=-0.001),999),dt(2.5,999),0),
        density = 25,col = 'red')

polygon(x = -c(3.5,3.5,seq(3.5,2.5,by=-0.001),2.5,2.5),
        y = c(0,dt(3.5,999),dt(seq(3.5,2.5,by=-0.001),999),dt(2.5,999),0),
        density = 25,col = 'red')

#t-distribution plot 3
plot(z,dt(z,999),type='l',main = 't-distribution, df = 999')
polygon(x = c(3.5,3.5,seq(3.5,1.96,by=-0.001),1.96,1.96),
        y = c(0,dt(3.5,999),dt(seq(3.5,1.96,by=-0.001),999),dt(1.96,999),0),
        density = 50,col = 'blue')

polygon(x = -c(3.5,3.5,seq(3.5,1.96,by=-0.001),1.96,1.96),
        y = c(0,dt(3.5,999),dt(seq(3.5,1.96,by=-0.001),999),dt(1.96,999),0),
        density = 50,col = 'blue')
polygon(x = c(3.5,3.5,seq(3.5,0.35592,by=-0.001),0.35592,0.35592),
        y = c(0,dt(3.5,999),dt(seq(3.5,0.35592,by=-0.001),999),dt(0.35592,999),0),
        density = 25,col = 'green')
polygon(x = -c(3.5,3.5,seq(3.5,0.35592,by=-0.001),0.35592,0.35592),
        y = c(0,dt(3.5,999),dt(seq(3.5,0.35592,by=-0.001),999),dt(0.35592,999),0),
        density = 25,col = 'green')


par(mfrow = c(1, 2))
plot(z,dt(z,999),type='l',main = 't-distribution, df = 999')
polygon(x = c(3.5,3.5,seq(3.5,1.96,by=-0.001),1.96,1.96),
        y = c(0,dt(3.5,999),dt(seq(3.5,1.96,by=-0.001),999),dt(1.96,999),0),
        density = 50,col = 'blue')

polygon(x = -c(3.5,3.5,seq(3.5,1.96,by=-0.001),1.96,1.96),
        y = c(0,dt(3.5,999),dt(seq(3.5,1.96,by=-0.001),999),dt(1.96,999),0),
        density = 50,col = 'blue')
polygon(x = c(3.5,3.5,seq(3.5,0.35592,by=-0.001),0.35592,0.35592),
        y = c(0,dt(3.5,999),dt(seq(3.5,0.35592,by=-0.001),999),dt(0.35592,999),0),
        density = 25,col = 'green')
polygon(x = -c(3.5,3.5,seq(3.5,0.35592,by=-0.001),0.35592,0.35592),
        y = c(0,dt(3.5,999),dt(seq(3.5,0.35592,by=-0.001),999),dt(0.35592,999),0),
        density = 25,col = 'green')

plot(z,dt(z,999),type='l',main = 't-distribution, df = 999')
polygon(x = c(3.5,3.5,seq(3.5,1.96,by=-0.001),1.96,1.96),
        y = c(0,dt(3.5,999),dt(seq(3.5,1.96,by=-0.001),999),dt(1.96,999),0),
        density = 50,col = 'blue')

polygon(x = -c(3.5,3.5,seq(3.5,1.96,by=-0.001),1.96,1.96),
        y = c(0,dt(3.5,999),dt(seq(3.5,1.96,by=-0.001),999),dt(1.96,999),0),
        density = 50,col = 'blue')


polygon(x = c(3.5,3.5,seq(3.5,2.5,by=-0.001),2.5,2.5),
        y = c(0,dt(3.5,999),dt(seq(3.5,2.5,by=-0.001),999),dt(2.5,999),0),
        density = 25,col = 'red')

polygon(x = -c(3.5,3.5,seq(3.5,2.5,by=-0.001),2.5,2.5),
        y = c(0,dt(3.5,999),dt(seq(3.5,2.5,by=-0.001),999),dt(2.5,999),0),
        density = 25,col = 'red')

#slide2
t.test(x,mu=175)
mean(x) - 175
sd(x)/sqrt(1000)
