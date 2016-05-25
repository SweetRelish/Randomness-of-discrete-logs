︠2cf83f55-e8b7-451a-825e-d4efb1681c82s︠
import sys
from sage.plot.scatter_plot import ScatterPlot

# increase output limit
sage_server.MAX_OUTPUT = 100000000
sage_server.MAX_OUTPUT_MESSAGES = 10000000

# determine set of primes computing for
primes_plot = list()
primes = set()
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

fp_plot = list()

def print_dlog(n):
    result = find_primitive_roots(n);
    fixed_points = 0
    for each_root in sorted(result):
        in_line = list()
        remainder_map = find_dlog_map(each_root, n)
        for each_remainder in remainder_map:
            in_line.append(remainder_map[each_remainder])
        fixed_points += Permutation(in_line).number_of_fixed_points()
    fp_plot.append((fixed_points+0.0)/len(result)-1)
    print "Average Number of Fixed Points:",(fixed_points+0.0)/len(result)
        
def find_dlog_map(each_root, n):
    remainder_map = dict();
    for i in range(1, n - 1):
        each_dlog = each_root ** i % n
        remainder_map[each_dlog] = i;
    return remainder_map

for num in sorted(test_cases):
    print "n =",num
    print_dlog(num)
    primes_plot.append(num)
    print "\n"*3

data = zip(primes_plot,fp_plot)
show(points(data),title="Difference Between DLog and Random of Expected Number of Fixed Points")
︡3c50be53-b2d9-4635-bed9-83266e1ce43b︡{"stdout":"n = 3\n\nAverage Number of Fixed Points: 1.00000000000000\n\n\n\n\nn = 5\n\nAverage Number of Fixed Points: 0.500000000000000\n\n\n\n\nn = 7\n\nAverage Number of Fixed Points: 0.000000000000000\n\n\n\n\nn = 11\n\nAverage Number of Fixed Points: 1.25000000000000\n\n\n\n\nn = 13\n\nAverage Number of Fixed Points: 1.00000000000000\n\n\n\n\nn = 17\n\nAverage Number of Fixed Points: 1.25000000000000\n\n\n\n\nn = 19\n\nAverage Number of Fixed Points: 1.33333333333333\n\n\n\n\nn = 23\n\nAverage Number of Fixed Points: 0.600000000000000\n\n\n\n\nn = 29\n\nAverage Number of Fixed Points: 0.583333333333333\n\n\n\n\nn = 31\n\nAverage Number of Fixed Points: 1.37500000000000\n\n\n\n\nn = 37\n\nAverage Number of Fixed Points: 0.916666666666667\n\n\n\n\nn = 41\n\nAverage Number of Fixed Points: 0.500000000000000\n\n\n\n\nn = 43\n\nAverage Number of Fixed Points: 0.666666666666667\n\n\n\n\nn = 47\n\nAverage Number of Fixed Points: 0.727272727272727\n\n\n\n\nn = 53\n\nAverage Number of Fixed Points: 0.875000000000000\n\n\n\n\nn = 59\n\nAverage Number of Fixed Points: 1.25000000000000\n\n\n\n\nn = 61\n\nAverage Number of Fixed Points: 0.687500000000000\n\n\n\n\nn = 67\n\nAverage Number of Fixed Points: 1.00000000000000\n\n\n\n\nn = 71\n\nAverage Number of Fixed Points: 0.875000000000000\n\n\n\n\nn = 73\n\nAverage Number of Fixed Points: 1.04166666666667\n\n\n\n\nn = 79\n\nAverage Number of Fixed Points: 0.666666666666667\n\n\n\n\nn = 83\n"}︡{"stdout":"\nAverage Number of Fixed Points: 1.17500000000000\n\n\n\n\nn = 89\n\nAverage Number of Fixed Points: 0.975000000000000\n\n\n\n\nn = 97\n\nAverage Number of Fixed Points: 1.03125000000000\n\n\n\n\nn = 101\n\nAverage Number of Fixed Points: 0.750000000000000\n\n\n\n\nn = 103\n\nAverage Number of Fixed Points: 0.968750000000000\n\n\n\n\nn = 107\n"}︡{"stdout":"\nAverage Number of Fixed Points: 1.13461538461538\n\n\n\n\nn = 109\n\nAverage Number of Fixed Points: 0.916666666666667\n\n\n\n\nn = 113\n\nAverage Number of Fixed Points: 1.10416666666667\n\n\n\n\nn = 127\n"}︡{"stdout":"\nAverage Number of Fixed Points: 0.916666666666667\n\n\n\n\nn = 131\n\nAverage Number of Fixed Points: 1.14583333333333\n\n\n\n\nn = 137\n\nAverage Number of Fixed Points:"}︡{"stdout":" 0.781250000000000\n\n\n\n\nn = 139\n\nAverage Number of Fixed Points: 1.18181818181818\n\n\n\n\nn = 149\n\nAverage Number of Fixed Points:"}︡{"stdout":" 1.01388888888889\n\n\n\n\nn = 151\n\nAverage Number of Fixed Points: 0.850000000000000\n\n\n\n\nn = 157\n\nAverage Number of Fixed Points:"}︡{"stdout":" 0.687500000000000\n\n\n\n\nn = 163\n\nAverage Number of Fixed Points: 0.981481481481482\n\n\n\n\nn = 167\n"}︡{"stdout":"\nAverage Number of Fixed Points: 0.853658536585366\n\n\n\n\nn = 173\n\nAverage Number of Fixed Points:"}︡{"stdout":" 0.916666666666667\n\n\n\n\nn = 179\n\nAverage Number of Fixed Points:"}︡{"stdout":" 1.14772727272727\n\n\n\n\nn = 181\n\nAverage Number of Fixed Points: 0.958333333333333\n\n\n\n\nn = 191\n"}︡{"stdout":"\nAverage Number of Fixed Points: 1.11111111111111\n\n\n\n\nn = 193\n\nAverage Number of Fixed Points:"}︡{"stdout":" 0.968750000000000\n\n\n\n\nn = 197\n\nAverage Number of Fixed Points:"}︡{"stdout":" 0.892857142857143\n\n\n\n\nn = 199\n\nAverage Number of Fixed Points: 0.916666666666667\n\n\n\n\nn = 211\n"}︡{"stdout":"\nAverage Number of Fixed Points: 0.958333333333333\n\n\n\n\nn = 223\n"}︡{"stdout":"\nAverage Number of Fixed Points: 0.875000000000000\n\n\n\n\nn = 227\n"}︡{"stdout":"\nAverage Number of Fixed Points: 1.11607142857143\n\n\n\n\nn = 229\n"}︡{"stdout":"\nAverage Number of Fixed Points: 0.972222222222222\n\n\n\n\nn = 233\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.875000000000000\n\n\n\n\nn = 239\n"}︡{"stdout":"\nAverage Number of Fixed Points: 0.802083333333333\n\n\n\n\nn = 241\n"}︡{"stdout":"\nAverage Number of Fixed Points: 1.04687500000000\n\n\n\n\nn = 251\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.07000000000000\n\n\n\n\nn = 257\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.937500000000000\n\n\n\n\nn = 263\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.892307692307692\n\n\n\n\nn = 269\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.06818181818182\n\n\n\n\nn = 271\n"}︡{"stdout":"\nAverage Number of Fixed Points: 0.958333333333333\n\n\n\n\nn = 277\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.909090909090909\n\n\n\n\nn = 281\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.760416666666667\n\n\n\n\nn = 283\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.06521739130435\n\n\n\n\nn = 293\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.04861111111111\n\n\n\n\nn = 307\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.947916666666667\n\n\n\n\nn = 311\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.925000000000000\n\n\n\n\nn = 313\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.00000000000000\n\n\n\n\nn = 317\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.967948717948718\n\n\n\n\nn = 331\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.900000000000000\n\n\n\n\nn = 337\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.958333333333333\n\n\n\n\nn = 347\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.07558139534884\n\n\n\n\nn = 349\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.01785714285714\n\n\n\n\nn = 353\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.900000000000000\n\n\n\n\nn = 359\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.887640449438202\n\n\n\n\nn = 367\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.891666666666667\n\n\n\n\nn = 373\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.13333333333333\n\n\n\n\nn = 379\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.972222222222222\n\n\n\n\nn = 383\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.905263157894737\n\n\n\n\nn = 389\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.07812500000000\n\n\n\n\nn = 397\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.15000000000000\n\n\n\n\nn = 401\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.906250000000000\n\n\n\n\nn = 409\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.921875000000000\n\n\n\n\nn = 419\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.08333333333333\n\n\n\n\nn = 421\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.854166666666667\n\n\n\n\nn = 431\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.857142857142857\n\n\n\n\nn = 433\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.875000000000000\n\n\n\n\nn = 439\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.986111111111111\n\n\n\n\nn = 443\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.22916666666667\n\n\n\n\nn = 449\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.864583333333333\n\n\n\n\nn = 457\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.986111111111111\n\n\n\n\nn = 461\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.02272727272727\n\n\n\n\nn = 463\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.933333333333333\n\n\n\n\nn = 467\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.08189655172414\n\n\n\n\nn = 479\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.890756302521008\n\n\n\n\nn = 487\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.901234567901235\n\n\n\n\nn = 491\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.922619047619048\n\n\n\n\nn = 499\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.03048780487805\n\n\n\n\nn = 503\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.912000000000000\n\n\n\n\nn = 509\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 0.964285714285714\n\n\n\n\nn = 521\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.01562500000000\n\n\n\n\nn = 523\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.04761904761905\n\n\n\n\nn = 541\n"}︡{"stdout":"\nAverage Number of Fixed Points:"}︡{"stdout":" 1.40972222222222\n\n\n\n\n"}︡{"file":{"filename":"/projects/582c664b-4df5-42c3-ac04-032673a1630c/.sage/temp/compute6-us/4907/tmp_UKhWqd.svg","show":true,"text":null,"uuid":"790677d9-bb70-43f5-856b-fdc978e0f7fb"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠0c520e2b-5ddf-4af6-a51f-503cb5c8599d︠









