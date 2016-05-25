︠4771dee4-5664-478e-ada1-3a8d78d86cd9s︠
import sys

# increase output limit
sage_server.MAX_OUTPUT = 100000000
sage_server.MAX_OUTPUT_MESSAGES = 10000000

# determine set of primes computing for
primes = set()
primes_plot = list()
for i in range(1,100):
    primes.add(Primes().unrank(i))

test_cases = primes

# calculate and return the gcd(greatest common divisor) of two numbers x and y;
# para: x, y the two numbers we calculate the gcd for.
# return the gcd of x and y.
def gcd(x, y):
    while x != 0 and y != 0:
        if x > y:
            x -= y
        else:
            y -= x
    if x > 0:
        return x
    else:
        return y

# find all primitive roots of number n and return a set of them.
# para: n the number which the set of primitive roots belong to
# return: set() the set of all primitive roots of n
def find_primitive_roots(n):
    coprime = set()
    result = set()
    for i in range(1, n):
        if gcd(i, n) == 1:
            coprime.add(i)
    highest_exp = len(coprime)
    for num in coprime:
        each_set = set()
        for exp in range(1, highest_exp + 1):
            remainder = num ** exp % n
            each_set.add(remainder)
            if remainder == 1:
                break
        if len(each_set) == len(coprime):
            result.add(num);
    print ""
    return result

number_plot = list()

# Expected number of cycles is H_n
##
def h_n(n):
    result = 0
    for i in range (1, n+1):
        result = result + 1.0 / i
    return result


##
##


def print_dlog(n):
    result = find_primitive_roots(n);
    count = 0
    for each_root in sorted(result):
        in_line = list()
        remainder_map = find_dlog_map(each_root, n)
        for each_remainder in remainder_map:
            in_line.append(remainder_map[each_remainder])
        count = count + len(Permutation(in_line).cycle_type())
    number_plot.append((count+0.0)/len(result))
    print "Average Number of Cycles:",(count+0.0)/len(result)
    ##
    print "Expected Number of Cycles of Random Permutation:", h_n(n)
    ##

        
def find_dlog_map(each_root, n):
    remainder_map = dict();
    for i in range(1, n - 1):
        each_dlog = each_root ** i % n
        remainder_map[each_dlog] = i;
    return remainder_map

for num in sorted(test_cases):
    print "n=",num 
    print_dlog(num)
    primes_plot.append(num)
    print '\n'*3
    
data = zip(primes_plot,number_plot)
#show(data)
show(points(data),title="Average Number of Cycles")
︡4b85b9c5-8f63-4296-9c60-cf06145368ad︡︡{"stdout":"n= 3\n\nAverage Number of Cycles: 1.00000000000000\nExpected Number of Cycles of Random Permutation 1.83333333333333\n\n\n\n\nn= 5\n\nAverage Number of Cycles: 1.50000000000000\nExpected Number of Cycles of Random Permutation 2.28333333333333\n\n\n\n\nn= 7\n\nAverage Number of Cycles: 2.00000000000000\nExpected Number of Cycles of Random Permutation 2.59285714285714\n\n\n\n\nn= 11\n\nAverage Number of Cycles: 3.50000000000000\nExpected Number of Cycles of Random Permutation 3.01987734487734\n\n\n\n\nn= 13\n\nAverage Number of Cycles: 3.50000000000000\nExpected Number of Cycles of Random Permutation 3.18013375513376\n\n\n\n\nn= 17\n\nAverage Number of Cycles: 3.00000000000000\nExpected Number of Cycles of Random Permutation 3.43955252264076\n\n\n\n\nn= 19\n\nAverage Number of Cycles: 4.33333333333333\nExpected Number of Cycles of Random Permutation 3.54773965714368\n\n\n\n\nn= 23\n\nAverage Number of Cycles: 3.80000000000000\nExpected Number of Cycles of Random Permutation 3.73429151108684\n\n\n\n\nn= 29\n\nAverage Number of Cycles: 3.66666666666667\nExpected Number of Cycles of Random Permutation 3.96165379758706\n\n\n\n\nn= 31\n\nAverage Number of Cycles: 4.75000000000000\nExpected Number of Cycles of Random Permutation 4.02724519543652\n\n\n\n\nn= 37\n\nAverage Number of Cycles: 3.50000000000000\nExpected Number of Cycles of Random Permutation 4.20158622382167\n\n\n\n\nn= 41\n\nAverage Number of Cycles: 3.50000000000000\nExpected Number of Cycles of Random Permutation 4.30293328283881\n\n\n\n\nn= 43\n\nAverage Number of Cycles: 3.33333333333333\nExpected Number of Cycles of Random Permutation 4.34999862060183\n\n\n\n\nn= 47\n\nAverage Number of Cycles: 4.18181818181818\nExpected Number of Cycles of Random Permutation 4.43796384173078\n\n\n\n\nn= 53\n\nAverage Number of Cycles: 4.75000000000000\nExpected Number of Cycles of Random Permutation 4.55691187522575\n\n\n\n\nn= 59\n\nAverage Number of Cycles: 4.85714285714286\nExpected Number of Cycles of Random Permutation 4.66320374628507\n\n\n\n\nn= 61\n\nAverage Number of Cycles: 5.25000000000000\nExpected Number of Cycles of Random Permutation 4.69626385557469\n\n\n\n\nn= 67\n\nAverage Number of Cycles:"}︡{"stdout":" 5.20000000000000\nExpected Number of Cycles of Random Permutation 4.78935240737623\n\n\n\n\nn= 71\n\nAverage Number of Cycles: 4.75000000000000\nExpected Number of Cycles of Random Permutation 4.84692126468032\n\n\n\n\nn= 73\n\nAverage Number of Cycles: 4.75000000000000\nExpected Number of Cycles of Random Permutation 4.87450878370620\n\n\n\n\nn= 79\n\nAverage Number of Cycles: 5.33333333333333\nExpected Number of Cycles of Random Permutation 4.95297927894552\n\n\n\n\nn= 83\n\nAverage Number of Cycles: 5.60000000000000\nExpected Number of Cycles of Random Permutation 5.00206827268017\n\n\n\n\nn= 89\n\nAverage Number of Cycles:"}︡{"stdout":" 5.00000000000000\nExpected Number of Cycles of Random Permutation 5.07145949173740\n\n\n\n\nn= 97\n\nAverage Number of Cycles: 5.12500000000000\nExpected Number of Cycles of Random Permutation 5.15707242590596\n\n\n\n\nn= 101\n\nAverage Number of Cycles: 4.75000000000000\nExpected Number of Cycles of Random Permutation 5.19727850773863\n\n\n\n\nn= 103\n"}︡{"stdout":"\nAverage Number of Cycles: 5.62500000000000\nExpected Number of Cycles of Random Permutation 5.21679116717134\n\n\n\n\nn= 107\n\nAverage Number of Cycles: 5.57692307692308\nExpected Number of Cycles of Random Permutation 5.25471011796720\n\n\n\n\nn= 109\n\nAverage Number of Cycles:"}︡{"stdout":" 5.33333333333333\nExpected Number of Cycles of Random Permutation 5.27314368915307\n\n\n\n\nn= 113\n\nAverage Number of Cycles: 5.41666666666667\nExpected Number of Cycles of Random Permutation 5.30902173620368\n\n\n\n\nn= 127\n\nAverage Number of Cycles:"}︡{"stdout":" 4.88888888888889\nExpected Number of Cycles of Random Permutation 5.42533459258917\n\n\n\n\nn= 131\n\nAverage Number of Cycles: 5.66666666666667\nExpected Number of Cycles of Random Permutation 5.45622492605224\n\n\n\n\nn= 137\n"}︡{"stdout":"\nAverage Number of Cycles: 5.21875000000000\nExpected Number of Cycles of Random Permutation 5.50084178584451\n\n\n\n\nn= 139\n\nAverage Number of Cycles:"}︡{"stdout":" 5.81818181818182\nExpected Number of Cycles of Random Permutation 5.51528240726042\n\n\n\n\nn= 149\n\nAverage Number of Cycles:"}︡{"stdout":" 5.91666666666667\nExpected Number of Cycles of Random Permutation 5.58451392197721\n\n\n\n\nn= 151\n\nAverage Number of Cycles: 5.40000000000000\nExpected Number of Cycles of Random Permutation 5.59780310520017\n\n\n\n\nn= 157\n"}︡{"stdout":"\nAverage Number of Cycles: 5.16666666666667\nExpected Number of Cycles of Random Permutation 5.63664280283959\n\n\n\n\nn= 163\n"}︡{"stdout":"\nAverage Number of Cycles: 5.88888888888889\nExpected Number of Cycles of Random Permutation 5.67403021389529\n\n\n\n\nn= 167\n"}︡{"stdout":"\nAverage Number of Cycles: 5.53658536585366\nExpected Number of Cycles of Random Permutation 5.69820050126915\n\n\n\n\nn= 173\n"}︡{"stdout":"\nAverage Number of Cycles: 5.66666666666667\nExpected Number of Cycles of Random Permutation 5.73339464845157\n\n\n\n\nn= 179\n"}︡{"stdout":"\nAverage Number of Cycles: 5.97727272727273\nExpected Number of Cycles of Random Permutation 5.76739216600544\n\n\n\n\nn= 181\n"}︡{"stdout":"\nAverage Number of Cycles: 6.04166666666667\nExpected Number of Cycles of Random Permutation 5.77847258343945\n\n\n\n\nn= 191\n"}︡{"stdout":"\nAverage Number of Cycles: 5.88888888888889\nExpected Number of Cycles of Random Permutation 5.83210460970744\n\n\n\n\nn= 193\n"}︡{"stdout":"\nAverage Number of Cycles: 5.87500000000000\nExpected Number of Cycles of Random Permutation 5.84249429019103\n\n\n\n\nn= 197\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 5.42857142857143\nExpected Number of Cycles of Random Permutation 5.86295531744280\n\n\n\n\nn= 199\n\nAverage Number of Cycles:"}︡{"stdout":" 5.80000000000000\nExpected Number of Cycles of Random Permutation 5.87303094812145\n\n\n\n\nn= 211\n\nAverage Number of Cycles:"}︡{"stdout":" 6.37500000000000\nExpected Number of Cycles of Random Permutation 5.93144159485238\n\n\n\n\nn= 223\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 5.63888888888889\nExpected Number of Cycles of Random Permutation 5.98662791308216\n\n\n\n\nn= 227\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.03571428571429\nExpected Number of Cycles of Random Permutation 6.00436670834557\n\n\n\n\nn= 229\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 5.77777777777778\nExpected Number of Cycles of Random Permutation 6.01311948548492\n\n\n\n\nn= 233\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.08928571428571\nExpected Number of Cycles of Random Permutation 6.03039850622203\n\n\n\n\nn= 239\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 5.93750000000000\nExpected Number of Cycles of Random Permutation 6.05576980815344\n\n\n\n\nn= 241\n\nAverage Number of Cycles:"}︡{"stdout":" 5.75000000000000\nExpected Number of Cycles of Random Permutation 6.06408585241347\n\n\n\n\nn= 251\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.46000000000000\nExpected Number of Cycles of Random Permutation 6.10465931317760\n\n\n\n\nn= 257\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 5.96875000000000\nExpected Number of Cycles of Random Permutation 6.12823601340094\n\n\n\n\nn= 263\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.27692307692308\nExpected Number of Cycles of Random Permutation 6.15126963298682\n\n\n\n\nn= 269\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.13636363636364\nExpected Number of Cycles of Random Permutation 6.17378462893120\n\n\n\n\nn= 271\n\nAverage Number of Cycles:"}︡{"stdout":" 6.00000000000000\nExpected Number of Cycles of Random Permutation 6.18117836953527\n\n\n\n\nn= 277\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.18181818181818\nExpected Number of Cycles of Random Permutation 6.20303713916841\n\n\n\n\nn= 281\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 5.43750000000000\nExpected Number of Cycles of Random Permutation 6.21734863829389\n\n\n\n\nn= 283\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.43478260869565\nExpected Number of Cycles of Random Permutation 6.22442830648927\n\n\n\n\nn= 293\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.31944444444444\nExpected Number of Cycles of Random Permutation 6.25909378786476\n\n\n\n\nn= 307\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.50000000000000\nExpected Number of Cycles of Random Permutation 6.30569119280210\n\n\n\n\nn= 311\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.35000000000000\nExpected Number of Cycles of Random Permutation 6.31861543253876\n\n\n\n\nn= 313\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 5.91666666666667\nExpected Number of Cycles of Random Permutation 6.32501544892280\n\n\n\n\nn= 317\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.37179487179487\nExpected Number of Cycles of Random Permutation 6.33769389656772\n\n\n\n\nn= 331\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.35000000000000\nExpected Number of Cycles of Random Permutation 6.38084385368612\n\n\n\n\nn= 337\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.02083333333333\nExpected Number of Cycles of Random Permutation 6.39878154101145\n\n\n\n\nn= 347\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.73255813953488\nExpected Number of Cycles of Random Permutation 6.42798067495358\n\n\n\n\nn= 349\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.39285714285714\nExpected Number of Cycles of Random Permutation 6.43371956768486\n\n\n\n\nn= 353\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.06250000000000\nExpected Number of Cycles of Random Permutation 6.44509948367172\n\n\n\n\nn= 359\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.20224719101124\nExpected Number of Cycles of Random Permutation 6.46193016445918\n\n\n\n\nn= 367\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.46666666666667\nExpected Number of Cycles of Random Permutation 6.48393929206745\n\n\n\n\nn= 373\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.80000000000000\nExpected Number of Cycles of Random Permutation 6.50013396815499\n\n\n\n\nn= 379\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.64814814814815\nExpected Number of Cycles of Random Permutation 6.51607055104803\n\n\n\n\nn= 383\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.51578947368421\nExpected Number of Cycles of Random Permutation 6.52655556901597\n\n\n\n\nn= 389\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.38541666666667\nExpected Number of Cycles of Random Permutation 6.54207980485837\n\n\n\n\nn= 397\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.81666666666667\nExpected Number of Cycles of Random Permutation 6.56241086269827\n\n\n\n\nn= 401\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.55000000000000\nExpected Number of Cycles of Random Permutation 6.57242345676254\n\n\n\n\nn= 409\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.51562500000000\nExpected Number of Cycles of Random Permutation 6.59215281666839\n\n\n\n\nn= 419\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.50000000000000\nExpected Number of Cycles of Random Permutation 6.61627942757755\n\n\n\n\nn= 421\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.70833333333333\nExpected Number of Cycles of Random Permutation 6.62103567687062\n\n\n\n\nn= 431\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.26190476190476\nExpected Number of Cycles of Random Permutation 6.64448339920784\n\n\n\n\nn= 433\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.48611111111111\nExpected Number of Cycles of Random Permutation 6.64910768284482\n\n\n\n\nn= 439\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.87500000000000\nExpected Number of Cycles of Random Permutation 6.66285359773692\n\n\n\n\nn= 443\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.97916666666667\nExpected Number of Cycles of Random Permutation 6.67191367848783\n\n\n\n\nn= 449\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.43750000000000\nExpected Number of Cycles of Random Permutation 6.68535172503235\n\n\n\n\nn= 457\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.59722222222222\nExpected Number of Cycles of Random Permutation 6.70299274868728\n\n\n\n\nn= 461\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.86363636363636\nExpected Number of Cycles of Random Permutation 6.71169791447873\n\n\n\n\nn= 463\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.58333333333333\nExpected Number of Cycles of Random Permutation 6.71602224385706\n\n\n\n\nn= 467\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.81896551724138\nExpected Number of Cycles of Random Permutation 6.72461520427516\n\n\n\n\nn= 479\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.54621848739496\nExpected Number of Cycles of Random Permutation 6.74995974044714\n\n\n\n\nn= 487\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.72839506172839\nExpected Number of Cycles of Random Permutation 6.76650613066255\n\n\n\n\nn= 491\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.88095238095238\nExpected Number of Cycles of Random Permutation 6.77467777696981\n\n\n\n\nn= 499\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.63414634146341\nExpected Number of Cycles of Random Permutation 6.79082342999052\n\n\n\n\nn= 503\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.44800000000000\nExpected Number of Cycles of Random Permutation 6.79879954141764\n\n\n\n\nn= 509\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.73015873015873\nExpected Number of Cycles of Random Permutation 6.81064567807357\n\n\n\n\nn= 521\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.69791666666667\nExpected Number of Cycles of Random Permutation 6.83392509254980\n\n\n\n\nn= 523\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 6.48809523809524\nExpected Number of Cycles of Random Permutation 6.83775284725116\n\n\n\n\nn= 541\n"}︡{"stdout":"\nAverage Number of Cycles:"}︡{"stdout":" 7.38888888888889\nExpected Number of Cycles of Random Permutation 6.87155887344176\n\n\n\n\n"}︡{"file":{"filename":"/projects/582c664b-4df5-42c3-ac04-032673a1630c/.sage/temp/compute6-us/29563/tmp_1HFQJ3.svg","show":true,"text":null,"uuid":"6137028c-da52-4f0b-9dd0-6a3b090d9b83"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}
︠a45bb6cb-984c-4acc-be5d-a5cb13751575s︠

x = [1,3,4]
len(x)
︡0b780f2c-6f11-4112-aedd-0eb0d67034e2︡︡{"stdout":"3\n"}︡{"done":true}












