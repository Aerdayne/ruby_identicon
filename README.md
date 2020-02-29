# Identicon generator

A simple CLI script that generates a 128x128 GitHub identicon from on entered string.

Image generation is handled by [chunky_png](https://github.com/wvanbergen/chunky_png) gem.

## Sample identicons
<div style="text-align:center">
  <img src="./img/ex01.png"/>
  <img src="./img/ex02.png"/>
  <img src="./img/ex03.png"/>
  <img src="./img/ex04.png"/>
  <img src="./img/ex05.png"/>
</div>

## Installation
* Install Ruby 2.6.3 using [RVM](https://rvm.io/)
```bash
rvm install ruby-2.6.3
rvm use ruby-2.6.3
```
* Clone the repository
* Switch to the app directory and run the following command:
```bash
ruby bin/app
```