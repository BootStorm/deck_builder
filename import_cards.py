#!/usr/bin/python
# imports the DB from mtgjson.com
import urllib2

allsets = "https://mtgjson.com/json/AllSets-x.json.zip"
allcards = "https://mtgjson.com/json/AllCards-x.json.zip"


def download_file(url):
    file_name = url.split('/')[-1]
    u = urllib2.urlopen(url)
    f = open(file_name, 'wb')
    meta = u.info()
    f_size = int(meta.getheaders("Content-Length")[0])
    print "Downloading: %s Bytes: %s" % (file_name, f_size)

    f_size_dl = 0
    block_size = 8192
    while True:
        buffer = u.read(block_size)
        if not buffer:
            break

        f_size_dl += len(buffer)
        f.write(buffer)
        status = r"%10d  [%3.2f%%]" % (f_size_dl, f_size_dl * 100. / f_size)
        status = status + chr(8)*(len(status)+1)
        print status,

    f.close()


def main():
    download_file(allsets)
    download_file(allcards)


if __name__ == "__main__":
    main()
