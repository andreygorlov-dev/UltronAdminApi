**Добавить карточку для страницы:**
```
var settings = {
  "url": "http://localhost:90/UltronAdminApi/Card/",
  "method": "POST",
  "timeout": 0,
  "headers": {
    "Content-Type": "application/json"
  },
  "data": JSON.stringify({
    "title": "Тест наименование Обновление2",
    "description": "Тест описание Обновление2",
    "videoSrc": "https://www.youtube.com/watch?v=CVyPO_tR540&list=RDTHV2b2tHEQE&index=2&ab_channel=PieceOfLembas",
    "idPage": 1,
    "img": {
      "imgBase64": "data:image/png;base64,..",
      "imgExtension": "png"
    }
  }),
};

$.ajax(settings).done(function (response) {
  console.log(response);
});
```
**Обновить карточку:**
id - id обновляемой карточки
Если не указать img в data то картинка останется та же.
```
var settings = {
  "url": "http://localhost:90/UltronAdminApi/Card/?id=5",
  "method": "POST",
  "timeout": 0,
  "headers": {
    "Content-Type": "application/json"
  },
  "data": JSON.stringify({
    "title": "Тест наименование Обновление2",
    "description": "Тест описание Обновление2",
    "videoSrc": "https://www.youtube.com/watch?v=CVyPO_tR540&list=RDTHV2b2tHEQE&index=2&ab_channel=PieceOfLembas",
    "idPage": 1,
    "img": {
      "imgBase64": "data:image/png;base64,..",
      "imgExtension": "png"
    }
  }),
};

$.ajax(settings).done(function (response) {
  console.log(response);
});
```
**Получить список карточек:**
id - id страницы
```
var settings = {
  "url": "http://localhost:90/UltronAdminApi/Card/?id=6",
  "method": "GET",
  "timeout": 0,
  "headers": {
    "Cookie": "PHPSESSID=v0pmvh0fv3bkfsrsevhliuunp4"
  },
};

$.ajax(settings).done(function (response) {
  console.log(response);
});
```
ОТВЕТ:
```
[
    {
        "ID": "25",
        "TITLE": "Тест наименование Обновление2",
        "DESCRIPTION": "Тест описание Обновление2",
        "IMG_SRC": "/img/c7c6f7b2312ed0fc4c0d0dc2eba28f4e.png",
        "VIDEO_SRC": "https://www.youtube.com/watch?v=CVyPO_tR540&list=RDTHV2b2tHEQE&index=2&ab_channel=PieceOfLembas"
    }
]
```

**Удалить карточку:**
id - id удаляемой карточки
```
var settings = {
  "url": "http://localhost:90/UltronAdminApi/Card/?id=26",
  "method": "DELETE",
  "timeout": 0,
  "headers": {
    "Cookie": "PHPSESSID=v0pmvh0fv3bkfsrsevhliuunp4"
  },
};

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

**Добавить страницу:**
```
var settings = {
  "url": "http://localhost:90/UltronAdminApi/Page/",
  "method": "POST",
  "timeout": 0,
  "headers": {
    "Content-Type": "application/json",
    "Cookie": "PHPSESSID=v0pmvh0fv3bkfsrsevhliuunp4"
  },
  "data": JSON.stringify({
    "name": "Документы Обновлено2",
    "img": {
      "imgBase64": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAf4AAAFeCAYAAABkc33LAAAABHNCSVQICAgIfAhkiAAAAF96VFh0UmF3IHByb2ZpbGUgdHlwZSBBUFAxAAAImeNKT81LLcpMVigoyk/...",
      "imgExtension": "png"
    }
  }),
};

$.ajax(settings).done(function (response) {
  console.log(response);
});
```
**Обновить страницу:**
id - id обновляемой страницы
Если не указать img в data то картинка останется та же.
```
var settings = {
  "url": "http://localhost:90/UltronAdminApi/Page/?id=7",
  "method": "PUT",
  "timeout": 0,
  "headers": {
    "Content-Type": "application/json",
    "Cookie": "PHPSESSID=v0pmvh0fv3bkfsrsevhliuunp4"
  },
  "data": JSON.stringify({
    "name": "Документы Обновлено3"
  }),
};

$.ajax(settings).done(function (response) {
  console.log(response);
});
```
**Получить список страниц:**
```
var settings = {
  "url": "http://localhost:90/UltronAdminApi/Page/",
  "method": "GET",
  "timeout": 0,
  "headers": {
    "Cookie": "PHPSESSID=v0pmvh0fv3bkfsrsevhliuunp4"
  },
};

$.ajax(settings).done(function (response) {
  console.log(response);
});
```
ОТВЕТ:
```
[
    {
        "ID": "7",
        "NAME": "Документы Обновлено3",
        "IMG_SRC": ""
    },
    {
        "ID": "8",
        "NAME": "Документы Обновлено2",
        "IMG_SRC": "/img/8ea5a882736eb638be08cd39d8bcb00f.png"
    }
]
```
**Удалить страницу:**
id - id удаляемой страницы
```
var settings = {
  "url": "http://localhost:90/UltronAdminApi/Page/?id=7",
  "method": "DELETE",
  "timeout": 0,
  "headers": {
    "Cookie": "PHPSESSID=v0pmvh0fv3bkfsrsevhliuunp4"
  },
};

$.ajax(settings).done(function (response) {
  console.log(response);
});
```