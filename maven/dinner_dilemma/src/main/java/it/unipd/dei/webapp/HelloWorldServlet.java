/*
 * Copyright 2018 University of Padua, Italy
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package it.unipd.dei.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

/**
 * Sample servlet to say "Hello, world!".
 * 
 * @author Nicola Ferro (ferro@dei.unipd.it)
 * @version 1.0
 * @since 1.0
 */
public class HelloWorldServlet extends HttpServlet {

	/**
	 * Manages HTTP GET requests by replying "Hello, world!"
	 * 
	 * @param req
	 *            the request from the client.
	 * @param res
	 *            the response from the server.
	 * 
	 * @throws ServletException
	 *             if any problem occurs while executing the servlet.
	 * @throws IOException
	 *             if any problem occurs while communicating between the client
	 *             and the server.
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		// set the MIME media type of the response
		res.setContentType("text/html; charset=utf-8");

		// get a stream to write the response
		PrintWriter out = res.getWriter();

		// write the HTML page
		out.printf("<!DOCTYPE html>%n");
		
		out.printf("<html lang=\"en\">%n");
		out.printf("<head>%n");
		out.printf("<meta charset=\"utf-8\">%n");
		out.printf("<title>HelloWorld Servlet Response</title>%n");
		out.printf("</head>%n");

		out.printf("<body>%n");
		out.printf("<h1>HelloWorld Servlet Response</h1>%n");
		out.printf("<hr/>%n");
		out.printf("<p>%n");
		out.printf("Hello, world!%n");
		out.printf("</p>%n");
		out.printf("</body>%n");
		
		out.printf("</html>%n");

		// flush the output stream buffer
		out.flush();

		// close the output stream
		out.close();

		// write a "log" statement
		System.out.printf("[INFO] HelloWorldServlet - %s - Request successfully served.%n",
						  new Timestamp(System.currentTimeMillis()).toString());

	}

}
