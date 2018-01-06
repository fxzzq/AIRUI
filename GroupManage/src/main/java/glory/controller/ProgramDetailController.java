package glory.controller;

import glory.entity.Article;
import glory.entity.Marking;
import glory.entity.ProgramDetails;
import glory.entity.User;
import glory.service.ArticleService;
import glory.service.MarkingService;
import glory.service.ProgramDetailsService;
import glory.util.ResponseJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("Marking")
public class ProgramDetailController {

    @Autowired(required = true)
    private ArticleService articleService;

    @Autowired(required=true)
    private ProgramDetailsService programDetailsService;

    @Autowired(required=true)
    private MarkingService markingService;
    private static    int programid=0;
    /**
     * 打分项目列表页
     * @param  request
     * @return String
     */
    @RequestMapping(value = "List1",method = RequestMethod.GET)
    public String list(HttpServletRequest request){
        List<ProgramDetails> articles =  programDetailsService.findAll();
        List<Marking> marking=markingService.findAll();
        if (articles !=null){
            request.setAttribute("articles", articles);
        }
        if (marking !=null){
            request.setAttribute("marking", marking);
        }
        return "marking/list1";
    }


    /**
     * 打分页
     * @param  id
     * @param  httpSession
     * @return String
     */
    @RequestMapping(value = "Edit1",method = RequestMethod.GET)
    public String edit(HttpSession httpSession,@RequestParam("id") int id){
        ProgramDetails  article= programDetailsService.getProgramDetailsById(id);
        ProgramDetails   article2=programDetailsService.findByUser(id);
       // programid=id;
        System.out.println("EDITXZQhahah_user:"+article2);

        if (article !=null){
            httpSession.setAttribute("article", article);

        //    request.setAttribute("programid", programid);
        }
        if (article2 !=null){
            System.out.println("nullEDITXZQhahah_user:"+article2);
            httpSession.setAttribute("article2", article2);
            System.out.println("33nullEDITXZQhahah_user:"+article2);

            //    request.setAttribute("programid", programid);
        }
        return "marking/handler1";
    }


}
