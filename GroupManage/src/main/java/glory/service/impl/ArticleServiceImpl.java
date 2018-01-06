package glory.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import glory.dao.ArticleDao;
import glory.entity.Article;

@Transactional // 开启事务注解
@Service 
public class ArticleServiceImpl implements glory.service.ArticleService {
	@Resource
	private ArticleDao articleDao;

	public List<Article> findAll(){
		List<Article> articles= articleDao.findAll();
		return articles;
	}

	public Article getArticleById(int id){
		Article article =articleDao.findById(id);
		return article;
	}

	public void updateArticle(Article article){
		articleDao.update(article);
	}

	@Override
	public void saveArticle(Article article) {
		articleDao.save(article);
	}

	@Override
	public void deleteArticle(Article article) {
		articleDao.delete(article);
	}
}
