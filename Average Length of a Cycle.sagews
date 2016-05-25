︠4771dee4-5664-478e-ada1-3a8d78d86cd9︠
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

length_plot = list()

def print_dlog(n):
    result = find_primitive_roots(n);
    length = 0
    count = 0
    for each_root in sorted(result):
        in_line = list()
        remainder_map = find_dlog_map(each_root, n)
        for each_remainder in remainder_map:
            in_line.append(remainder_map[each_remainder])
        length = length + (n-2.0)/len(Permutation(in_line).cycle_type())
    length_plot.append(length/len(result))
    print "Expected Length of a Cycle:",length/len(result)

        
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
    
data = zip(primes_plot,length_plot)
#show(data)
show(points(data),title="Expected Length of a Cycle")
︡17616da3-0526-494a-9842-2befb8532a40︡︡{"stdout":"n= 3\n\nAverage Length of a Cycle: 1.00000000000000\n\n\n\n\nn= 5\n\nAverage Length of a Cycle: 2.25000000000000\n\n\n\n\nn= 7\n\nAverage Length of a Cycle: 2.50000000000000\n\n\n\n\nn= 11\n\nAverage Length of a Cycle: 2.81250000000000\n\n\n\n\nn= 13\n\nAverage Length of a Cycle: 3.52916666666667\n\n\n\n\nn= 17\n\nAverage Length of a Cycle: 5.53125000000000\n\n\n\n\nn= 19\n\nAverage Length of a Cycle: 4.48611111111111\n\n\n\n\nn= 23\n\nAverage Length of a Cycle: 5.88000000000000\n\n\n\n\nn= 29\n\nAverage Length of a Cycle: 8.21250000000000\n\n\n\n\nn= 31\n\nAverage Length of a Cycle: 6.83571428571429\n\n\n\n\nn= 37\n\nAverage Length of a Cycle: 11.5972222222222\n\n\n\n\nn= 41\n\nAverage Length of a Cycle: 12.5125000000000\n\n\n\n\nn= 43\n\nAverage Length of a Cycle: 13.6666666666667\n\n\n\n\nn= 47\n\nAverage Length of a Cycle: 13.0397727272727\n\n\n\n\nn= 53\n\nAverage Length of a Cycle: 12.0290178571429\n\n\n\n\nn= 59\n\nAverage Length of a Cycle: 14.4244897959184\n\n\n\n\nn= 61\n\nAverage Length of a Cycle: 12.5726190476190\n\n\n\n\nn= 67\n\nAverage Length of a Cycle: 14.5437500000000\n\n\n\n\nn= 71\n\nAverage Length of a Cycle:"}︡{"stdout":" 15.6801587301587\n\n\n\n\nn= 73\n\nAverage Length of a Cycle: 17.9331349206349\n\n\n\n\nn= 79\n\nAverage Length of a Cycle: 16.9774305555556\n\n\n\n\nn= 83\n\nAverage Length of a Cycle: 17.7428571428571\n\n\n\n\nn= 89\n\nAverage Length of a Cycle: 20.9568154761905\n\n\n\n\nn= 97\n"}︡{"stdout":"\nAverage Length of a Cycle: 20.4820188492063\n\n\n\n\nn= 101\n\nAverage Length of a Cycle: 24.0704464285714\n\n\n\n\nn= 103\n\nAverage Length of a Cycle: 20.6997395833333\n\n\n\n\nn= 107\n\nAverage Length of a Cycle:"}︡{"stdout":" 23.2925407925408\n\n\n\n\nn= 109\n\nAverage Length of a Cycle: 23.6728064373898\n\n\n\n\nn= 113\n\nAverage Length of a Cycle: 25.6412202380952\n\n\n\n\nn= 127\n\nAverage Length of a Cycle:"}︡{"stdout":" 28.5590277777778\n\n\n\n\nn= 131\n\nAverage Length of a Cycle: 25.6432291666667\n\n\n\n\nn= 137\n\nAverage Length of a Cycle:"}︡{"stdout":" 31.3183593750000\n\n\n\n\nn= 139\n\nAverage Length of a Cycle: 28.3453233635052\n\n\n\n\nn= 149\n\nAverage Length of a Cycle:"}︡{"stdout":" 27.7058517871018\n\n\n\n\nn= 151\n\nAverage Length of a Cycle: 30.5568253968254\n\n\n\n\nn= 157\n"}︡{"stdout":"\nAverage Length of a Cycle: 33.7563244047619\n\n\n\n\nn= 163\n\nAverage Length of a Cycle:"}︡{"stdout":" 31.3304012345679\n\n\n\n\nn= 167\n\nAverage Length of a Cycle:"}︡{"stdout":" 36.0871080139373\n\n\n\n\nn= 173\n\nAverage Length of a Cycle:"}︡{"stdout":" 34.0482026901670\n\n\n\n\nn= 179\n\nAverage Length of a Cycle:"}︡{"stdout":" 35.1413961038961\n\n\n\n\nn= 181\n\nAverage Length of a Cycle: 33.6557291666667\n\n\n\n\nn= 191\n"}︡{"stdout":"\nAverage Length of a Cycle: 35.8093750000000\n\n\n\n\nn= 193\n"}︡{"stdout":"\nAverage Length of a Cycle: 38.2935577876984\n\n\n\n\nn= 197\n"}︡{"stdout":"\nAverage Length of a Cycle: 43.1435657596372\n\n\n\n\nn= 199\n"}︡{"stdout":"\nAverage Length of a Cycle: 40.1934722222222\n\n\n\n\nn= 211\n"}︡{"stdout":"\nAverage Length of a Cycle: 39.8994200244200\n\n\n\n\nn= 223\n"}︡{"stdout":"\nAverage Length of a Cycle: 44.3094356261023\n\n\n\n\nn= 227\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 42.7901785714286\n\n\n\n\nn= 229\n\nAverage Length of a Cycle:"}︡{"stdout":" 44.6631007495591\n\n\n\n\nn= 233\n\nAverage Length of a Cycle:"}︡{"stdout":" 44.4739583333333\n\n\n\n\nn= 239\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 46.2693459318459\n\n\n\n\nn= 241\n\nAverage Length of a Cycle:"}︡{"stdout":" 52.8504323367605\n\n\n\n\nn= 251\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 46.0933852813853\n\n\n\n\nn= 257\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 49.5872860863095\n\n\n\n\nn= 263\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 48.7964835164835\n\n\n\n\nn= 269\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 51.8544962613144\n\n\n\n\nn= 271\n\nAverage Length of a Cycle:"}︡{"stdout":" 50.3323713323713\n\n\n\n\nn= 277\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 54.6554834054834\n\n\n\n\nn= 281\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 60.4269345238095\n\n\n\n\nn= 283\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 48.7827727827728\n\n\n\n\nn= 293\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 53.9587510868760\n\n\n\n\nn= 307\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 52.3810726310726\n\n\n\n\nn= 311\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 55.3134809634809\n\n\n\n\nn= 313\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 62.5677838654401\n\n\n\n\nn= 317\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 59.6363860498476\n\n\n\n\nn= 331\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 57.5667832167833\n\n\n\n\nn= 337\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 65.8165377735690\n\n\n\n\nn= 347\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 58.2856104651163\n\n\n\n\nn= 349\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 62.7242320427588\n\n\n\n\nn= 353\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 67.4333035714286\n\n\n\n\nn= 359\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 65.9069799114742\n\n\n\n\nn= 367\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 63.8279265873015\n\n\n\n\nn= 373\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 65.1287260424761\n\n\n\n\nn= 379\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 64.2508631286409\n\n\n\n\nn= 383\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 69.6375375939850\n\n\n\n\nn= 389\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 68.2529465326340\n\n\n\n\nn= 397\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 65.4860349141599\n\n\n\n\nn= 401\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 71.0196346882284\n\n\n\n\nn= 409\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 74.1577578888125\n\n\n\n\nn= 419\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 74.2519246031746\n\n\n\n\nn= 421\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 70.7966761826137\n\n\n\n\nn= 431\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 81.3130102040816\n\n\n\n\nn= 433\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 72.6214938321709\n\n\n\n\nn= 439\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 71.2065955649288\n\n\n\n\nn= 443\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 73.1212890625000\n\n\n\n\nn= 449\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 79.0538373085248\n\n\n\n\nn= 457\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 79.2679135101010\n\n\n\n\nn= 461\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 76.8158624046408\n\n\n\n\nn= 463\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 85.5050104361870\n\n\n\n\nn= 467\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 79.3831484607347\n\n\n\n\nn= 479\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 84.5021533613446\n\n\n\n\nn= 487\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 81.2105110253258\n\n\n\n\nn= 491\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 79.5127444727891\n\n\n\n\nn= 499\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 83.2086038622624\n\n\n\n\nn= 503\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 89.0873428571428\n\n\n\n\nn= 509\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 87.8782368755583\n\n\n\n\nn= 521\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 88.4527445211038\n\n\n\n\nn= 523\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 93.1021683673470\n\n\n\n\nn= 541\n"}︡{"stdout":"\nAverage Length of a Cycle:"}︡{"stdout":" 82.2834772673313\n\n\n\n\n"}︡{"file":{"filename":"/projects/582c664b-4df5-42c3-ac04-032673a1630c/.sage/temp/compute6-us/19942/tmp_jkL3wA.svg","show":true,"text":null,"uuid":"754c94d1-962f-45a7-9535-d902f8895bba"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}
︠82fb1df4-64f9-489e-a486-15411ca07381︠









