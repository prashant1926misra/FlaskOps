import requests

def url_ok(url):
    try:
        r = requests.head(url, timeout=5)
        return r.status_code == 200
    except Exception as e:
        print("Error reaching app:", e)
        return False

if __name__ == "__main__":
    url = "http://43.205.211.118:5000/health"
    if url_ok(url):
        print("App is healthy")
        exit(0)
    else:
        print("App is not healthy")
        exit(1)
