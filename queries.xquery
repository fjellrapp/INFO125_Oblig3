<!-- 1. Find the titles of the books in the XML document -->
//book/title

<!-- 2. Find the names of all editors of a collection -->

//chapter/editors

<!-- Return the publications that are not in english -->

for $lang in //publication/*/language
where $lang != 'english'
return $lang

<!-- 4.  Return the highest cited publication published before the year 2010 -->

for $cited in //publication/*/cited
where $cited //..[published < 2010]
return <ul><li>{$cited} , {$cited/../title}</li></ul>

<!-- 5. Find the number of publications published in 2009 -->

let $path := //publication/*/published
    for $published in distinct-values($path)
        let $count := count($path[. eq $published])
where $published= 2009
return $count

<!-- 6. Find the year in which there are the most publications -->



<!-- 7. Find the publications in which "C List" appears as a third author -->

//publication/*[author[3] ="c list"]

<!-- 8. Find publications where the word 'judgment' appears in the title -->

//title[contains(., "judgment")]

<!-- 9. find the highest number of publications X that have at least X citations -->

let $publication := //publication/*[cited>300]
   for $cited in $publication
   where $publication
   return 
   <ul>
   <li>{$cited/title} </li> <li> {$cited/cited} </li> 
</ul>

<!-- 10. Return the names of the journals that have published an article with at least three authors-->

for $x in //publication/article
where $x/author[3]
order by $x/journal
return $x/journal


<!-- 11.  Create an XML from the publications separating them based on the position where “C
List" occurs as an author and then into journals, books and collections. -->

11. <ul>
{
for $x in distinct-values(doc("publications.xml") /publications/article/journal)
order by count($x)
return <li>{data($x), count($x)}</li>
}
</ul>


for $x in distinct-values(doc("publications (1).xml") /publications/*/published)
order by count($x)
return $x
