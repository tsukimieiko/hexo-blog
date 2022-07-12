---
title: CSS图形与布局
date: 2022-07-12 22:22:22
categories:
- CSS
tags:
- CSS
---

使用`CSS`绘制简单的图形与使用`CSS`实现的一些简单的布局

<!--more-->

## CSS 图形

> 三角形

```css
<div id="triangle"></div>
#triangle { 
    width: 0px; 
    height: 0px; 
    border-left: 40px solid transparent; 
    border-right: 40px solid transparent; 
    border-bottom: 80px solid red; 
}
```
> 梯形

```css
<div id="trapezoid"></div>
#trapezoid { 
    width: 80px;
    height: 0px; 
    border-left: 40px solid transparent; 
    border-right: 40px solid transparent; 
    border-bottom: 80px solid red; 
}
```
> 原型

```css
<div id="circular"></div>
#circular { 
    width: 80px;
    height: 80px;
    border-radius: 50%;
    background-color: red;
}
```
**注：**`transparent`代表全透明黑色，类似于`rgba(0,0,0,0)`的值

## 垂直居中

```css
<div id="box">
    <div id="child">test vertical align</div>
</div>

/********** one **********/
#box {
    width: 300px;
    height: 300px;
    /* 防止外边距塌陷 解决方法: 父元素加 overflow:hidden 或 边框(二选一) */
    border: 1px solid red;
    overflow: hidden;
    background-color: pink;
}
#child {
    width: 100px;
    height: 100px;
    margin:50% auto;
    transform: translateY(-50%); 
    background-color: plum;
}

/********** two **********/
#box {
    width: 300px;
    height: 300px;
    position: relative;
    background-color: pink;
}
#child {
    width: 100px;
    height: 100px;
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: plum;
}

/********** three **********/
#box {
    width: 300px;
    height: 300px;
    position: relative;
    background-color: pink;
}
#child {
    width: 100px;
    height: 100px;
    position: absolute;
    top: 50%;
    margin-top: -50px;
    background-color: plum;
}

/********** four **********/
#box {
    width: 300px;
    height: 300px;
    position: relative;
    background-color: pink;
}
#child {
    width: 100px;
    height: 100px;
    position: absolute;
    top: 0;
    right:0;
    bottom:0;
    left: 0;
    margin:auto;
    background-color: plum;
}

/********** flex **********/
#box {
    width: 200px;
    height: 200px;
    display: flex;
    align-items: center; 			// 垂直居中
    justify-content: center;	// 水平居中
    background-color: pink;
}
#child {
    width: 100px;
    height: 100px;
    background-color: plum;
}

/********** grid **********/
#box {
    width: 200px;
    height: 200px;
    display: grid;
    align-content: center;		// 垂直居中
    justify-content: center;	// 水平居中
    background-color: pink;
}
#child {
    width: 100px;
    height: 100px;
    align-self: center;				// 垂直居中（与box中属性选一个就行）
    justify-self: center;			// 水平居中（与box中属性选一个就行）
    background-color: plum;
}
```
## 三列布局
```css
/********* one **********/
<div id="parent">
    <div id="left"></div>
    <div id="middle"></div>
    <div id="right"></div>
</div>

#parent {
    position: relative;
}
#left {
    width: 200px;
    height: 200px;
    top: 0;
    left: 0;
    position: absolute;
    background-color: pink;
}
#middle {
    height: 200px;
    /* 处理中间列的内容有一部分会被左边的列遮住 */
    padding: 0 200px; 
    background-color: deeppink;
}
#right {
    width: 200px;
    height: 200px;
    position: absolute;
    top: 0;
    right: 0;
    background-color: pink;
}

/********* two **********/
<div id="left"></div>
<div id="right"></div>
<div id="middle"></div>

div {
    height: 200px;
}
#left, #right {
    width: 200px;
    background: pink;
}
#left {
    float: left;
}
#middle {
    background: deeppink;
}
#right {
    float: right;
}
```
## 圣杯布局
```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <script src=""></script>
</head>

<style>
body {
    min-width: 450px;			/* 2x leftContent width + rightContent width */
}
#header, #footer {
    height: 60px;
    background: yellow;
    clear:both;
}
#container {
    padding: 0 150px;
}
.column {
    position: relative;
    float: left;
    height: 300px;
}
#center {
    width: 100%;
    background: pink;
}
#left {
    width: 150px;
    right: 150px;
    margin-left: -100%;		/* 先算 margin 再算 right */
    background: deeppink;
}
#right {
    width: 150px;
    right: -150px;
    margin-left: -150px;	/* 先算 margin 再算 right */
    background: coral;
}
</style>

<body>
    <div id="header"></div>
    <div id="container">
        <div id="center" class="column"></div>
        <div id="left" class="column"></div>
        <div id="right" class="column"></div>
    </div>
    <div id="footer"></div>
</body>
</html>
```
## 双飞翼布局
```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <script src=""></script>
</head>

<style>
body {
    min-width: 450px;			/* 2x leftContent width + rightContent width */
}
#header, #footer {
    height: 60px;
    background-color: yellow;
    clear:both;
}
#left, #center, #right {
    float: left;
}
#center {
    width: 100%;
    background-color: pink;
}
#left {
    width: 150px;
    margin-left: -100%;
    background-color: coral;
}
#right {
    width: 150px;
    margin-left: -150px;
    background-color: deeppink;
}
.column {
    height: 300px;
}
.content {
    margin: 0 150px;
}
</style>

<body>
    <div id="header"></div>
    <div id="container">
        <div id="center" class="column">
            <div class="content"></div>
        </div>
        <div id="left" class="column"></div>
        <div id="right" class="column"></div>
    </div>
    <div id="footer"></div>
</body>
</html>
```
