# PHP - performance

---

# get Execution Time

```PHP
    public function index()
    {
        // current Unix timestamp with microseconds
        // param: is float type
        $time_start = microtime(true);
        // target function or methods.
        $time = microtime(true) - $time_start;
        return $time // or echo $time
    }
```

---

# get Max Memory Size Used By PHP Application.

```PHP
    public function index()
    {
        // param: Set this to true to get the real size of memory allocated from system. If not set or false only the memory used by emalloc() is reported.
        // return: the memory peak in bytes.
        memory_get_peak_usage();
    }
```

---

# get Log (Laravel)

```PHP
    use Log;
    public function index()
    {
        Log::info(__CLASS__ . '::' . __FUNCTION__ . ' line:' . __LINE__ . ' ' . 'log test info message.');
        Log::alert(__CLASS__ . '::' . __FUNCTION__ . ' line:' . __LINE__ . ' ' . 'log test alert message.');
        Log::debug(__CLASS__ . '::' . __FUNCTION__ . ' line:' . __LINE__ . ' ' . 'log test debug message.');
    }
```


---

