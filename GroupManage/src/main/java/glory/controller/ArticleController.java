package glory.controller;


import glory.entity.Article;
import glory.entity.User;
import glory.service.ArticleService;
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
@RequestMapping("Article")
public class ArticleController {

	@Autowired(required = true)
	private ArticleService articleService;


	/**
	 * 文章列表页
	 * @param  request
	 * @return String
	 */
	@RequestMapping(value = "List",method = RequestMethod.GET)
	public String list(HttpServletRequest request){
		List<Article> articles =  articleService.findAll();

		if (articles !=null){
			request.setAttribute("articles", articles);
		}
		return "article/list";
	}


	/**
	 * 新建文章页
	 * @param
	 * @return
	 */
	@RequestMapping(value = "Create",method = RequestMethod.GET)
	public String create(){
		return "article/handler";
	}


	/**
	 * 编辑文章页
	 * @param  id
	 * @param  request
	 * @return String
	 */
	@RequestMapping(value = "Edit",method = RequestMethod.GET)
	public String edit(HttpServletRequest request,@RequestParam("id") int id){
		Article  article= articleService.getArticleById(id);
		if (article !=null){
			request.setAttribute("article", article);
		}
		return "article/handler";
	}

	/**
	 * 文章详情页
	 * @param  id
	 * @param  request
	 * @return String
	 */
	@RequestMapping(value = "Details",method = RequestMethod.GET)
	public String details(HttpServletRequest request,@RequestParam("id") int id){
		Article  article= articleService.getArticleById(id);
		if (article !=null){
			request.setAttribute("article", article);
		}
		return "article/details";
	}


	/**
	 * Ajax提交编辑文章信息
	 * @param  id
	 * @param  title
	 * @param  content
	 * @return ResponseJson
	 */
	@RequestMapping(value = "EditForm",method = RequestMethod.POST)
	@ResponseBody
	public ResponseJson editForm(HttpServletRequest request,@RequestParam("id") int id,@RequestParam("title") String title, @RequestParam("content") String content){
		Article  article= articleService.getArticleById(id);

		ResponseJson responseJson;
		article.setTitle(title);
		article.setContent(content);
		articleService.updateArticle(article);
		responseJson = new ResponseJson(0, null, "编辑成功");
		return responseJson;
	}

	/**
	 * Ajax提交新建文章信息
	 * @param  title
	 * @param  content
	 * @return ResponseJson
	 */
	@RequestMapping(value = "CreateForm",method = RequestMethod.POST)
	@ResponseBody
	public ResponseJson createForm(@RequestParam("title") String title, @RequestParam("content") String content, HttpSession httpSession){
		ResponseJson responseJson;
		User user= (User) httpSession.getAttribute("User");
		System.out.println("ARTICLEXZQhahah_user:"+user);
		Article article = new Article();
		article.setTitle(title);
		article.setContent(content);
		article.setarticleByUser(user);

		articleService.saveArticle(article);

		responseJson = new ResponseJson(0, null, "新添成功");


		return responseJson;

	}


	/**
	 * Ajax提交删除信息
	 * @param  id
	 * @return ResponseJson
	 */
	@RequestMapping(value = "DeleteForm",method = RequestMethod.POST)
	@ResponseBody
	public ResponseJson deleteForm(@RequestParam("id") int id){
		ResponseJson responseJson;

		Article article = new Article();
		article.setId(id);

		articleService.deleteArticle(article);

		responseJson = new ResponseJson(0, null, "删除成功");

		return responseJson;
	}
}
