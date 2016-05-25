︠4cdd1ca4-3037-4e75-9d18-c4eaa1e5a761︠

︡ec3f94ec-020c-4d70-89c5-3d7dac221431︡
︠e9c51405-3edb-4148-910d-f8a612f64522s︠
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
            # print num, "is a primitive root of", n
            result.add(num);
    print ""
    return result

length_plot = list()

## Expected length of longest cycle approximately 0.62*n
## lambda_1 is Golomb-Dickman constant
lambda_1 = 0.62432998854
expectedLengths = list()
## 



def print_dlog(n):
    result = find_primitive_roots(n);
    avg_longest_cycle = 0
    for each_root in sorted(result):
        in_line = list()
        remainder_map = find_dlog_map(each_root, n)
        for each_remainder in remainder_map:
            in_line.append(remainder_map[each_remainder])
        avg_longest_cycle += Permutation(in_line).cycle_type()[0]
    length_plot.append((avg_longest_cycle+0.0)/len(result))
    print "Average Length of Longest Cycle:",(avg_longest_cycle+0.0)/len(result)
    ##
    print "Expected Length of Longest Cycle of a Random permutation:", lambda_1*n
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
    print ""
    print ""
    print ""

new_length_plot = list()
for i in range(len(length_plot)):
    new_length_plot.append(length_plot[i] / primes_plot[i])
data = zip(primes_plot,new_length_plot)
show(points(data))

︡6d9dea31-12d7-428a-a1f1-901e757a77e0︡{"stdout":"n= 3\n\nAverage Length of Longest Cycle: 1.00000000000000\nExpected Length of Longest Cycle of a Random permutation: 1.87298996562000\n\n\n\nn= 5\n\nAverage Length of Longest Cycle: 2.50000000000000\nExpected Length of Longest Cycle of a Random permutation: 3.12164994270000\n\n\n\nn= 7\n\nAverage Length of Longest Cycle: 3.00000000000000\nExpected Length of Longest Cycle of a Random permutation: 4.37030991978000\n\n\n\nn= 11\n\nAverage Length of Longest Cycle: 4.75000000000000\nExpected Length of Longest Cycle of a Random permutation: 6.86762987394000\n\n\n\nn= 13\n\nAverage Length of Longest Cycle: 5.75000000000000\nExpected Length of Longest Cycle of a Random permutation: 8.11628985102000\n\n\n\nn= 17\n\nAverage Length of Longest Cycle: 11.0000000000000\nExpected Length of Longest Cycle of a Random permutation: 10.6136098051800\n\n\n\nn= 19\n\nAverage Length of Longest Cycle: 8.16666666666667\nExpected Length of Longest Cycle of a Random permutation: 11.8622697822600\n\n\n\nn= 23\n\nAverage Length of Longest Cycle: 12.4000000000000\nExpected Length of Longest Cycle of a Random permutation: 14.3595897364200\n\n\n\nn= 29\n\nAverage Length of Longest Cycle: 15.8333333333333\nExpected Length of Longest Cycle of a Random permutation: 18.1055696676600\n\n\n\nn= 31\n\nAverage Length of Longest Cycle: 17.5000000000000\nExpected Length of Longest Cycle of a Random permutation: 19.3542296447400\n\n\n\nn= 37\n\nAverage Length of Longest Cycle: 26.0000000000000\nExpected Length of Longest Cycle of a Random permutation: 23.1002095759800\n\n\n\nn= 41\n\nAverage Length of Longest Cycle: 25.7500000000000\nExpected Length of Longest Cycle of a Random permutation: 25.5975295301400\n\n\n\nn= 43\n\nAverage Length of Longest Cycle: 27.6666666666667\nExpected Length of Longest Cycle of a Random permutation: 26.8461895072200\n\n\n\nn= 47\n\nAverage Length of Longest Cycle: 29.3636363636364\nExpected Length of Longest Cycle of a Random permutation: 29.3435094613800\n\n\n\nn= 53\n\nAverage Length of Longest Cycle: 30.5833333333333\nExpected Length of Longest Cycle of a Random permutation: 33.0894893926200\n\n\n\nn= 59\n\nAverage Length of Longest Cycle: 35.1428571428571\nExpected Length of Longest Cycle of a Random permutation: 36.8354693238600\n\n\n\nn= 61\n\nAverage Length of Longest Cycle:"}︡{"stdout":" 30.2500000000000\nExpected Length of Longest Cycle of a Random permutation: 38.0841293009400\n\n\n\nn= 67\n\nAverage Length of Longest Cycle: 39.3500000000000\nExpected Length of Longest Cycle of a Random permutation: 41.8301092321800\n\n\n\nn= 71\n\nAverage Length of Longest Cycle: 40.7500000000000\nExpected Length of Longest Cycle of a Random permutation: 44.3274291863400\n\n\n\nn= 73\n\nAverage Length of Longest Cycle: 47.3750000000000\nExpected Length of Longest Cycle of a Random permutation: 45.5760891634200\n\n\n\nn= 79\n\nAverage Length of Longest Cycle:"}︡{"stdout":" 47.5833333333333\nExpected Length of Longest Cycle of a Random permutation: 49.3220690946600\n\n\n\nn= 83\n\nAverage Length of Longest Cycle: 45.8000000000000\nExpected Length of Longest Cycle of a Random permutation: 51.8193890488200\n\n\n\nn= 89\n\nAverage Length of Longest Cycle: 53.3500000000000\nExpected Length of Longest Cycle of a Random permutation: 55.5653689800600\n\n\n\nn= 97\n"}︡{"stdout":"\nAverage Length of Longest Cycle: 60.8125000000000\nExpected Length of Longest Cycle of a Random permutation: 60.5600088883800\n\n\n\nn= 101\n\nAverage Length of Longest Cycle: 62.5000000000000\nExpected Length of Longest Cycle of a Random permutation: 63.0573288425400\n\n\n\nn= 103\n\nAverage Length of Longest Cycle:"}︡{"stdout":" 62.3437500000000\nExpected Length of Longest Cycle of a Random permutation: 64.3059888196200\n\n\n\nn= 107\n\nAverage Length of Longest Cycle: 64.5769230769231\nExpected Length of Longest Cycle of a Random permutation: 66.8033087737800\n\n\n\nn= 109\n\nAverage Length of Longest Cycle:"}︡{"stdout":" 64.9166666666667\nExpected Length of Longest Cycle of a Random permutation: 68.0519687508600\n\n\n\nn= 113\n\nAverage Length of Longest Cycle: 75.1041666666667\nExpected Length of Longest Cycle of a Random permutation: 70.5492887050200\n\n\n\nn= 127\n\nAverage Length of Longest Cycle:"}︡{"stdout":" 82.7777777777778\nExpected Length of Longest Cycle of a Random permutation: 79.2899085445800\n\n\n\nn= 131\n\nAverage Length of Longest Cycle: 77.7291666666667\nExpected Length of Longest Cycle of a Random permutation: 81.7872284987400\n\n\n\nn= 137\n"}︡{"stdout":"\nAverage Length of Longest Cycle: 80.7968750000000\nExpected Length of Longest Cycle of a Random permutation: 85.5332084299800\n\n\n\nn= 139\n"}︡{"stdout":"\nAverage Length of Longest Cycle: 84.3636363636364\nExpected Length of Longest Cycle of a Random permutation: 86.7818684070600\n\n\n\nn= 149\n"}︡{"stdout":"\nAverage Length of Longest Cycle: 89.5277777777778\nExpected Length of Longest Cycle of a Random permutation: 93.0251682924600\n\n\n\nn= 151\n"}︡{"stdout":"\nAverage Length of Longest Cycle: 94.2500000000000\nExpected Length of Longest Cycle of a Random permutation: 94.2738282695400\n\n\n\nn= 157\n"}︡{"stdout":"\nAverage Length of Longest Cycle: 98.2500000000000\nExpected Length of Longest Cycle of a Random permutation: 98.0198082007800\n\n\n\nn= 163\n"}︡{"stdout":"\nAverage Length of Longest Cycle: 100.092592592593\nExpected Length of Longest Cycle of a Random permutation: 101.765788132020\n\n\n\nn= 167\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 102.012195121951\nExpected Length of Longest Cycle of a Random permutation: 104.263108086180\n\n\n\nn= 173\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 104.309523809524\nExpected Length of Longest Cycle of a Random permutation: 108.009088017420\n\n\n\nn= 179\n\nAverage Length of Longest Cycle:"}︡{"stdout":" 110.375000000000\nExpected Length of Longest Cycle of a Random permutation: 111.755067948660\n\n\n\nn= 181\n\nAverage Length of Longest Cycle:"}︡{"stdout":" 113.604166666667\nExpected Length of Longest Cycle of a Random permutation: 113.003727925740\n\n\n\nn= 191\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 122.041666666667\nExpected Length of Longest Cycle of a Random permutation: 119.247027811140\n\n\n\nn= 193\n\nAverage Length of Longest Cycle:"}︡{"stdout":" 117.000000000000\nExpected Length of Longest Cycle of a Random permutation: 120.495687788220\n\n\n\nn= 197\n"}︡{"stdout":"\nAverage Length of Longest Cycle: 127.130952380952\nExpected Length of Longest Cycle of a Random permutation: 122.993007742380\n\n\n\nn= 199\n"}︡{"stdout":"\nAverage Length of Longest Cycle: 120.166666666667\nExpected Length of Longest Cycle of a Random permutation: 124.241667719460\n\n\n\nn= 211\n"}︡{"stdout":"\nAverage Length of Longest Cycle: 123.687500000000\nExpected Length of Longest Cycle of a Random permutation: 131.733627581940\n\n\n\nn= 223\n"}︡{"stdout":"\nAverage Length of Longest Cycle: 133.625000000000\nExpected Length of Longest Cycle of a Random permutation: 139.225587444420\n\n\n\nn= 227\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 141.035714285714\nExpected Length of Longest Cycle of a Random permutation: 141.722907398580\n\n\n\nn= 229\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 145.444444444444\nExpected Length of Longest Cycle of a Random permutation: 142.971567375660\n\n\n\nn= 233\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 140.875000000000\nExpected Length of Longest Cycle of a Random permutation: 145.468887329820\n\n\n\nn= 239\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 145.468750000000\nExpected Length of Longest Cycle of a Random permutation: 149.214867261060\n\n\n\nn= 241\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 158.687500000000\nExpected Length of Longest Cycle of a Random permutation: 150.463527238140\n\n\n\nn= 251\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 157.420000000000\nExpected Length of Longest Cycle of a Random permutation: 156.706827123540\n\n\n\nn= 257\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 164.562500000000\nExpected Length of Longest Cycle of a Random permutation: 160.452807054780\n\n\n\nn= 263\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 161.223076923077\nExpected Length of Longest Cycle of a Random permutation: 164.198786986020\n\n\n\nn= 269\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 169.333333333333\nExpected Length of Longest Cycle of a Random permutation: 167.944766917260\n\n\n\nn= 271\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 170.069444444444\nExpected Length of Longest Cycle of a Random permutation: 169.193426894340\n\n\n\nn= 277\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 159.545454545455\nExpected Length of Longest Cycle of a Random permutation: 172.939406825580\n\n\n\nn= 281\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 176.906250000000\nExpected Length of Longest Cycle of a Random permutation: 175.436726779740\n\n\n\nn= 283\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 178.967391304348\nExpected Length of Longest Cycle of a Random permutation: 176.685386756820\n\n\n\nn= 293\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 182.194444444444\nExpected Length of Longest Cycle of a Random permutation: 182.928686642220\n\n\n\nn= 307\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 183.343750000000\nExpected Length of Longest Cycle of a Random permutation: 191.669306481780\n\n\n\nn= 311\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 189.291666666667\nExpected Length of Longest Cycle of a Random permutation: 194.166626435940\n\n\n\nn= 313\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 206.947916666667\nExpected Length of Longest Cycle of a Random permutation: 195.415286413020\n\n\n\nn= 317\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 193.544871794872\nExpected Length of Longest Cycle of a Random permutation: 197.912606367180\n\n\n\nn= 331\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 203.712500000000\nExpected Length of Longest Cycle of a Random permutation: 206.653226206740\n\n\n\nn= 337\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 217.145833333333\nExpected Length of Longest Cycle of a Random permutation: 210.399206137980\n\n\n\nn= 347\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 214.441860465116\nExpected Length of Longest Cycle of a Random permutation: 216.642506023380\n\n\n\nn= 349\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 208.133928571429\nExpected Length of Longest Cycle of a Random permutation: 217.891166000460\n\n\n\nn= 353\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 214.856250000000\nExpected Length of Longest Cycle of a Random permutation: 220.388485954620\n\n\n\nn= 359\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 226.224719101124\nExpected Length of Longest Cycle of a Random permutation: 224.134465885860\n\n\n\nn= 367\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 217.450000000000\nExpected Length of Longest Cycle of a Random permutation: 229.129105794180\n\n\n\nn= 373\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 227.458333333333\nExpected Length of Longest Cycle of a Random permutation: 232.875085725420\n\n\n\nn= 379\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 244.481481481481\nExpected Length of Longest Cycle of a Random permutation: 236.621065656660\n\n\n\nn= 383\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 235.510526315789\nExpected Length of Longest Cycle of a Random permutation: 239.118385610820\n\n\n\nn= 389\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 242.682291666667\nExpected Length of Longest Cycle of a Random permutation: 242.864365542060\n\n\n\nn= 397\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 239.158333333333\nExpected Length of Longest Cycle of a Random permutation: 247.859005450380\n\n\n\nn= 401\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 246.037500000000\nExpected Length of Longest Cycle of a Random permutation: 250.356325404540\n\n\n\nn= 409\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 255.031250000000\nExpected Length of Longest Cycle of a Random permutation: 255.350965312860\n\n\n\nn= 419\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 263.266666666667\nExpected Length of Longest Cycle of a Random permutation: 261.594265198260\n\n\n\nn= 421\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 254.239583333333\nExpected Length of Longest Cycle of a Random permutation: 262.842925175340\n\n\n\nn= 431\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 265.976190476190\nExpected Length of Longest Cycle of a Random permutation: 269.086225060740\n\n\n\nn= 433\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 257.388888888889\nExpected Length of Longest Cycle of a Random permutation: 270.334885037820\n\n\n\nn= 439\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 264.097222222222\nExpected Length of Longest Cycle of a Random permutation: 274.080864969060\n\n\n\nn= 443\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 268.885416666667\nExpected Length of Longest Cycle of a Random permutation: 276.578184923220\n\n\n\nn= 449\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 275.390625000000\nExpected Length of Longest Cycle of a Random permutation: 280.324164854460\n\n\n\nn= 457\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 285.208333333333\nExpected Length of Longest Cycle of a Random permutation: 285.318804762780\n\n\n\nn= 461\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 275.471590909091\nExpected Length of Longest Cycle of a Random permutation: 287.816124716940\n\n\n\nn= 463\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 295.558333333333\nExpected Length of Longest Cycle of a Random permutation: 289.064784694020\n\n\n\nn= 467\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 290.767241379310\nExpected Length of Longest Cycle of a Random permutation: 291.562104648180\n\n\n\nn= 479\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 308.617647058824\nExpected Length of Longest Cycle of a Random permutation: 299.054064510660\n\n\n\nn= 487\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 307.672839506173\nExpected Length of Longest Cycle of a Random permutation: 304.048704418980\n\n\n\nn= 491\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 311.857142857143\nExpected Length of Longest Cycle of a Random permutation: 306.546024373140\n\n\n\nn= 499\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 311.323170731707\nExpected Length of Longest Cycle of a Random permutation: 311.540664281460\n\n\n\nn= 503\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 317.728000000000\nExpected Length of Longest Cycle of a Random permutation: 314.037984235620\n\n\n\nn= 509\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 323.555555555556\nExpected Length of Longest Cycle of a Random permutation: 317.783964166860\n\n\n\nn= 521\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 325.859375000000\nExpected Length of Longest Cycle of a Random permutation: 325.275924029340\n\n\n\nn= 523\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 348.779761904762\nExpected Length of Longest Cycle of a Random permutation: 326.524584006420\n\n\n\nn= 541\n"}︡{"stdout":"\nAverage Length of Longest Cycle:"}︡{"stdout":" 330.472222222222\nExpected Length of Longest Cycle of a Random permutation: 337.762523800140\n\n\n\n"}︡{"file":{"filename":"/projects/582c664b-4df5-42c3-ac04-032673a1630c/.sage/temp/compute6-us/5889/tmp_dytSO2.svg","show":true,"text":null,"uuid":"4105a633-ff23-4865-8cb0-8d795bbde0c7"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠3ce56571-7fe4-4f1a-be45-48eb0c9fecf8︠










