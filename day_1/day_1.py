count = 0

with open('input.txt', 'r') as i:
    lines = list(map(int, i.readlines()))
    prev = lines[0]
    for line in lines[1:]:
        if line > prev:
            count += 1
        prev = line

print(count)


# part 2
windowed = zip(lines, lines[1:], lines[2:])
sums = list(map(sum, windowed))
prev = sums[0]
sum_count = 0
for sum in sums:
    if sum > prev:
        sum_count += 1
    prev = sum

print(sum_count)