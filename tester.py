import re
import time

times = [10000, 20000, 40000, 80000]
regex = re.compile("^[a-z]+(\.[a-z]+)*[A-Z][a-z]+$")

# ^[a-z]+(\.[a-z]+)*[A-Z][a-z]+$

for n in times:

    s = "a" * n + "1"

    start = time.perf_counter()
    regex.match(s)
    total = time.perf_counter() - start

    print(n, total)

