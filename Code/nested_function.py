def get_key_value(obj, key):
    keys = key.split("/")
    for k in keys:
        obj = obj[k]
    return obj

object = {"a":{"b":{"c":"d"}}}
key = "a/b/c"
print(get_value(object, key)) # Output: "d"

object = {"x":{"y":{"z":"a"}}}
key = "x/y/z"
print(get_value(object, key)) # Output: "a"
