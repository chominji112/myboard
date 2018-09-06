package net.developia.restful.methodtest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("rest")
public class MethodTestController {
	
	private static Logger logger = LoggerFactory.getLogger(MethodTestController.class);
	
	@GetMapping("/")
	public String getAction() {
		logger.info("get action");
		return "Get Action 수행 중...";
	}
	@PostMapping("/")
	public String postAction() {
		logger.info("post action");
		return "post Action 수행 중...";
	}
	@PutMapping("/")
	public String putAction() {
		logger.info("put action");
		return "Put Action 수행 중...";
	}
	@DeleteMapping("/")
	public String deleteAction() {
		logger.info("delete action");
		return "Delete Action 수행 중...";
	}
}
