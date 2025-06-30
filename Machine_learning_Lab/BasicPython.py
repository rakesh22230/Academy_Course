# 1. Print Hello World
print("Hello World")

# 2. Input your name and print it
name = input("Enter your name: ")
print("Your name is", name)

# 3. Add two numbers
a = int(input("Enter first number: "))
b = int(input("Enter second number: "))
print("Sum is", a + b)

# 4. Swap two numbers
x = int(input("Enter first number (x): "))
y = int(input("Enter second number (y): "))
x, y = y, x
print("After swapping: x =", x, "y =", y)

# 5. Check if a number is even or odd
num = int(input("Enter a number: "))
if num % 2 == 0:
    print("Even number")
else:
    print("Odd number")

# 6. Find the largest among three numbers
n1 = int(input("Enter first number: "))
n2 = int(input("Enter second number: "))
n3 = int(input("Enter third number: "))
if n1 >= n2 and n1 >= n3:
    print("Largest number is", n1)
elif n2 >= n1 and n2 >= n3:
    print("Largest number is", n2)
else:
    print("Largest number is", n3)

# 7. Print numbers from 1 to 10
for i in range(1, 11):
    print(i)

# 8. Print the multiplication table of a number
n = int(input("Enter a number for multiplication table: "))
for i in range(1, 11):
    print(f"{n} x {i} = {n*i}")

# 9. Sum of n natural numbers
n = int(input("Enter a number: "))
sum_n = 0
for i in range(1, n + 1):
    sum_n += i
print("Sum is", sum_n)

# 10. Check if a number is prime
num = int(input("Enter a number: "))
if num < 2:
    print("Not a prime number")
else:
    for i in range(2, int(num**0.5) + 1):
        if num % i == 0:
            print("Not a prime number")
            break
    else:
        print("Prime number")

# 11. Count vowels in a string
text = input("Enter a string: ").lower()
count = 0
for ch in text:
    if ch in "aeiou":
        count += 1
print("Number of vowels:", count)

# 12. Check if a string is a palindrome
word = input("Enter a word: ")
if word == word[::-1]:
    print("Palindrome")
else:
    print("Not a palindrome")

# 13. Find the largest number in a list
nums = list(map(int, input("Enter numbers separated by space: ").split()))
print("Largest number is", max(nums))

# 14. Reverse a list
nums = list(map(int, input("Enter numbers separated by space: ").split()))
print("Reversed list:", nums[::-1])

# 15. Create a function to add two numbers
def add(x, y):
    return x + y

a = int(input("Enter first number: "))
b = int(input("Enter second number: "))
print("Sum is", add(a, b))

# 16. Function to find factorial of a number
def factorial(n):
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

num = int(input("Enter a number: "))
print("Factorial is", factorial(num))

# 17. Create a dictionary for a student
student = {
    "name": "Alice",
    "roll": 101,
    "marks": 85
}
print("Student info:", student)

# 18. Write and read a text file
with open("myfile.txt", "w") as f:
    f.write("Hello Python")

with open("myfile.txt", "r") as f:
    content = f.read()
    print("File content:", content)

# 19. Fetch data from an API (weather)
import requests
city = input("Enter city name: ")
API_KEY = '105450e8bb58d41f8374b982b5c64934'
url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={API_KEY}&units=metric"
try:
    response = requests.get(url)
    data = response.json()
    if data.get("cod") != 200:
        print("Error:", data.get("message"))
    else:
        print(f"Temperature in {data['name']}: {data['main']['temp']}°C")
except Exception as e:
    print("API Error:", e)

# 20. Handle division by zero error
try:
    a = int(input("Enter numerator: "))
    b = int(input("Enter denominator: "))
    print("Result:", a / b)
except ZeroDivisionError:
    print("Cannot divide by zero!")
