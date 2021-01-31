# JavaScriot - cookie

---

# get all cookies

```TypeScript
  /**
   * get cookies.
   * @return {string[]} cookies
   */
  getCookies() {
    return document.cookie.split(',')
  }
```

# get cookie

```TypeScript
  /**
   * get specific cookie.
   * @param {string} key
   * @return {string} cookie
   */
  getCookie(key: string = '') {
    const targetCookie = document.cookie.split(',').find(value => value.startsWith(`${key}=`))
    if (targetCookie === undefined) {
      return ''
    }
    // RegExpオブジェクトの作成
    const regex = new RegExp(`${key}=`, 'g') // コンストラクター記法(スラッシュで囲わない)
    return targetCookie.replace(regex, '')

    // or
    // return targetCookie.replace(new RegExp(`${key}=`, 'g'), '')
    // return targetCookie === undefined ? '' : targetCookie.replace(new RegExp(`${key}=`, 'g'), '')
  }
```

# Install nvm

```TypeScript
  /**
   * set cookie.
   * @param {string} key
   * @param {string} value
   * @return {void}
   */
  setCookie(key: string, value: string, minutes: number = 60) {
    document.cookie = `${key}=${value};max-age=${60 * minutes}`
  }
```

# Install nvm

```TypeScript
  /**
   * remove cookies.
   * @param {string} key
   * @return {void}
   */
  removeCookie(key: string) {
    document.cookie = `${key}=;max-age=0`
  }
```

---