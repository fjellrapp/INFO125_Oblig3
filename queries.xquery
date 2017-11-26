
1. //book/title

2. //chapter/editors

3. for $lang in //publication/*/language
where $lang != 'english'
return $lang


4. 
for $cited in //publication/*/cited
where $cited //..[published < 2010]
return <ul><li>{$cited} , {$cited/../title}</li></ul>

5. let $path := //publication/*/published
    for $published in distinct-values($path)
        let $count := count($path[. eq $published])
where $published= 2009
return $count


6. 

7. //publication/*[author[3] ="c list"]

8. //title[contains(., "judgment")]

9. let $publication := //publication/*[cited>300]
   for $cited in $publication
   where $publication
   return 
   <ul>
   <li>{$cited/title} </li> <li> {$cited/cited} </li> 
</ul>


10. for $x in //publication/article
where $x/author[3]
order by $x/journal
return $x/journal



11. <ul>
{
for $x in distinct-values(doc("publications.xml") /publications/article/journal)
order by count($x)
return <li>{data($x), count($x)}</li>
}
</ul>

 DENNE ER IKKE KOMPLETT

6. let $list := (*)
return (
for $bo in  distinct-values($list/*/published)
let $occurance := count($list[published eq $bo])
order by $occurance descending
return $bo)

for $x in distinct-values(doc("publications (1).xml") /publications/*/published)
order by count($x)
return $x

denne gjør det samme som den over. men e helt lik det som har blitt gjort i 12. 
