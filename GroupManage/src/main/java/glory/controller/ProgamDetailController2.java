package glory.controller;

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
@RequestMapping("Marking2")
public class ProgamDetailController2 {

    @Autowired(required = true)
    private ArticleService articleService;

    @Autowired(required=true)
    private ProgramDetailsService programDetailsService;

    @Autowired(required=true)
    private MarkingService markingService;
    private static    int programid=0;


    /**
     * Ajax提交详细打分信息
     * @param  systemfunctiongrade
     * @param  techdifficultygrade
     * @param  overallperformancegrade
     * @param  pagelayoutgrade
     * @param  groupname
     * @param  programname
     * @return ResponseJson
     */
    @RequestMapping(value = "SubmitGradeForm",method = RequestMethod.POST)
    @ResponseBody
    public ResponseJson submitGradeForm(@RequestParam("programname") String programname, @RequestParam("groupname") String groupname, @RequestParam("num1") int systemfunctiongrade, @RequestParam("num2") int techdifficultygrade, @RequestParam("num3") int overallperformancegrade, @RequestParam("num4") int pagelayoutgrade, HttpSession httpSession){
        ResponseJson responseJson;

      //  User user= (User) httpSession.getAttribute("User");
        ProgramDetails user3= (ProgramDetails)httpSession.getAttribute("article2");
      //  ProgramDetails user2= (ProgramDetails) httpSession.getAttribute("article3");
        System.out.println("XZQhahah_user:"+user3);

        Marking article = new Marking();
        article.setGroupname(groupname);
        article.setProgramname(programname);
        article.setSystemfunctiongrade(systemfunctiongrade);
        article.setTechdifficultygrade(techdifficultygrade);
        article.setOverallperformancegrade(overallperformancegrade);
        article.setPagelayoutgrade(pagelayoutgrade);

        article.setMarkingByProgramId(user3);

        programDetailsService.submitmarkingInfo(article);
        responseJson = new ResponseJson(0, null, "打分数据提交成功");

        return responseJson;

    }
}
