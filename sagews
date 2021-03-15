︠
#[Susceptible, Infected, Recovered, Lost]
p = 3014000 #susceptible population
inf = 2 #number of initially infected people
N= 720  #days after March 13

a=2.25/100000
c=11/10000

Markov=Matrix([[1-a,0,0,0],[a,0.98-c,0.01,0],[0,0.02,0.99,0],[0,c,0,1]])
Pop=vector([p-inf,inf,0,0])

spread=[Markov^i*Pop for i in [0,1,2,..N] ]
spread[N]
sum(spread[N])
︡
day=[1..N]
susceptible= [spread[i][0] for i in range(N)]
infected = [spread[i][1] for i in range(N)]
recovered = [spread[i][2] for i in range(N)]
lost = [spread[i][3] for i in range(N)]
︡
import numpy as np
import matplotlib.pyplot as plt

plt.stackplot(day, lost, infected, susceptible, recovered, colors=['r','b','k', 'g'])
plt.xlabel('Days')
plt.ylabel('Number of Individuals')
plt.title('Cases in Population of Size '+ str( p))

plt.plot([],[],color='r', label='Lost', linewidth=5)
plt.plot([],[],color='b', label='Infected', linewidth=5)
plt.plot([],[],color='k', label='Susceptible', linewidth=5)
plt.plot([],[],color='g', label='Recovered', linewidth=5)

plt.legend(loc='upper right')
plt.show()
︡17dc5468-1326-43f8-bd57-019b601dacfa︡{"stdout":"[<matplotlib.collections.PolyCollection object at 0x7f116eb7d750>, <matplotlib.collections.PolyCollection object at 0x7f116eb3a850>, <matplotlib.collections.PolyCollection object at 0x7f116eb3ab10>, <matplotlib.collections.PolyCollection object at 0x7f116eb3add0>]\n"}︡{"stdout":"Text(0.5,0,'Days')\n"}︡{"stdout":"Text(0,0.5,'Number of Individuals')\n"}︡{"stdout":"Text(0.5,1,'Cases in Population of Size 3014000')\n"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7f116eb93e90>]\n"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7f116eb50610>]\n"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7f116eb50a10>]\n"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7f116eb50e10>]\n"}︡{"stdout":"<matplotlib.legend.Legend object at 0x7f116eb5d2d0>\n"}︡{"file":{"filename":"19780f1e-b91c-40b7-82c0-4d4aa89aa0b7.svg","show":true,"text":null,"uuid":"064312c0-fbd7-4b6e-8f7d-8d5eee1bbc7d"},"once":false}︡{"done":true}
︠7bf35979-3e9b-4356-8af8-2e7dc50b77c6s︠


maxInColumns = np.amax(spread, axis=0)
 
print('The Max value of each group:', maxInColumns)

result = np.where(spread == maxInColumns)
print('Tuple of arrays returned : ', result)


 
print('List of coordinates of maximum value in array : ')
# zip the 2 arrays to get the exact coordinates
listOfCordinates = list(zip(result[0], result[1]))
# travese over the list of cordinates
for cord in listOfCordinates:
    print(cord)
︡9cee82e7-1161-4d97-bd7b-4cc65ef01fec︡{"stdout":"('The Max value of each group:', array([3013998.        ,   15030.47803524,   26671.15628381,\n          6734.30400684]))\n"}︡{"stdout":"('Tuple of arrays returned : ', (array([  0, 720, 720, 720]), array([0, 1, 2, 3])))\n"}︡{"stdout":"List of coordinates of maximum value in array : \n"}︡{"stdout":"(0, 0)\n(720, 1)\n(720, 2)\n(720, 3)\n"}︡{"done":true}
︠814df519-21b4-4dd8-955c-2fa38246c2c6s︠
print("Maximum Number of Confirmed Cases after N Days:", maxInColumns[1])
print("Maximum Number of Recovered Individuals after N Days:", maxInColumns[2])
print("Maximum Number of Lost Individuals after N Days:", maxInColumns[3])
︡
maxInColumns[2]/(maxInColumns[0]-maxInColumns[3])

︡
plt.stackplot(day, lost, recovered, infected, colors=['r','g','b'])
plt.xlabel('Days')
plt.ylabel('Number of Individuals')
plt.title('Cases in Population of Size '+ str( p))
plt.plot((322.75,322.25), (0,maxInColumns[2]), 'k-')

plt.plot([],[],color='r', label='Lost', linewidth=5)
plt.plot([],[],color='g', label='Recovered', linewidth=5)
plt.plot([],[],color='b', label='Infected', linewidth=5)
plt.plot([],[],color='k', label='Peak of Infection', linewidth=5)

plt.legend(loc='upper right')
plt.show()
︡
lost[33]
recovered[33]
infected[33]

︡
#Values by April 10 Match closely and were used to project into future: 
#('Maximum Number of Confirmed Cases after N Days:', 1368.672833913582)
#('Maximum Number of Recovered Individuals after N Days:', 375.37458623494547)
#('Maximum Number of Lost Individuals after N Days:', 20.64560224292199)
︡









