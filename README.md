# outc17
Repo for a talk at the 2017 OmniUpdate User Training Conference

## Demo

* [Tag Demo](http://www.unco.edu/jesse/outc17/)
* [Slides and Resourcs from the Presentation](http://jessclark.com/outc17)

## Install
Upload the folder /tag-demo/ to the root of your OU Instance. If it is uploaded to a sub directory, see the note below about updating the XSL Path.

### Tags

Tags are not stored in the datafiles, they are stored in OU Campus's database so tags need to be added to the data files!

Open up the /data folder and add the following tags to the data files:

* journal-africana
* journal-children
* journal-history
* journal-reading
* journal-science
* journal-theatre

Publish all files and go to the index page. 

### XSL Path (optional)

The XSL path may need to be changed on all of the XSL files. If you upload it at the root of OU Campus then you will be fine:

```
<?pcf-stylesheet path="/tag-demo/xsl/page-all.xsl" title="Interior Page 1.1" extension="html"?>
```

However, if you upload it into a directory, this will need to be updated to reflect the new path. Use find and replace.

## Contact

Jesse.Clark@unco.edu 
