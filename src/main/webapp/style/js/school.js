var schoolInit = function(_school, _college, _major, defaultSchool, defaultCollege, defaultMajor)  
{  
    var school = document.getElementById(_school);  
    var college = document.getElementById(_college);  
    var major = document.getElementById(_major);  
      
    function cmbSelect(cmb, str)  
    {  
        for(var i=0; i<cmb.options.length; i++)  
        {  
            if(cmb.options[i].value == str)  
            {  
                cmb.selectedIndex = i;  
                return;  
            }  
        }  
    }  
    function cmbAddOption(cmb, str, obj)  
    {  
        var option = document.createElement("OPTION");  
        cmb.options.add(option);  
        option.innerText = str;  
        option.value = str;  
        option.obj = obj;  
    }  
      
    function changeCollege()  
    {  
        major.options.length = 0;  
        if(college.selectedIndex == -1)return;  
        var item = college.options[college.selectedIndex].obj;  
        for(var i=0; i<item.majorList.length; i++)  
        {  
            cmbAddOption(major, item.majorList[i], null);  
        }  
        cmbSelect(major, defaultMajor);  
    }  
    function changeSchool()  
    {  
        college.options.length = 0;  
        college.onchange = null;  
        if(school.selectedIndex == -1)return;  
        var item = school.options[school.selectedIndex].obj;  
        for(var i=0; i<item.collegeList.length; i++)  
        {  
            cmbAddOption(college, item.collegeList[i].name, item.collegeList[i]);  
        }  
        cmbSelect(college, defaultCollege);  
        changeCollege();  
        college.onchange = changeCollege;  
    }  
      
    for(var i=0; i<schoolList.length; i++)  
    {  
        cmbAddOption(school, schoolList[i].name, schoolList[i]);  
    }  
    cmbSelect(school, defaultSchool);  
    changeSchool();  
    school.onchange = changeSchool;  
}  
  
var schoolList = [  
{name:'大连海事大学', collegeList:[           
{name:'航海学院', majorList:['航海技术','船舶电子电气工程','海事管理']},          
{name:'信息科学技术学院', majorList:['计算机科学与技术','软件工程','网络工程','物联网工程','智能科学与技术']},          
{name:'交通运输与管理学院', majorList:['信息管理与信息系统','工商管理','市场营销','财务管理','公共事业管理','行政管理']}  
]},  
{name:'大连理工大学', collegeList:[           
{name:'环境科学与工程学院', majorList:['环境工程专业','海洋科学专业','海洋资源与环境专业']},           
{name:'电子信息与电气工程', majorList:['电气信息类','电子信息工程','计算机科学与技术','生物医学工程']}  
]},        
{name:'中国海洋大学', collegeList:[           
{name:'海洋与大气学院', majorList:['海洋科学','大气科学']},          
{name:'化学化工学院', majorList:['化学','化学工程与工艺']},          
{name:'海洋地球科学学院', majorList:['地质学','勘查技术与工程','地球信息科学与技术']},             
{name:'水产学院', majorList:['水产养殖学','海洋渔业科学与技术','海洋资源与环境 ']},          
{name:'国家保密学院', majorList:['保密管理']}  
]}
];  