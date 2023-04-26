FROM	ubuntu:latest

RUN		apt update && apt install -y curl git vim

RUN		git clone --depth=1 https://github.com/romkatv/gitstatus.git ~/gitstatus && \
		echo 'source ~/gitstatus/gitstatus.prompt.sh' >> ~/.bashrc

WORKDIR	/run/shared


RUN		git config --global user.email "pixailz1@gmail.com"	&& \
		git config --global user.name "Pixailz"				&& \
		git clone https://github.com/Pixailz/lib_bash && cd lib_bash && \
		git rm -r test && git commit -m "test1" && \
		echo "pass" >> ./src/log && git add . && git commit -m "test2" && \
		echo "pass" >> ./test3 && git add . && git commit -m "test3" && \
		git rm ./src/tui && \
		echo "pass" >> ./src/parse && git add . && \
		echo "pass" >> ./test4 && git add . && \
		rm ./src/progress_bar && \
		echo "pass" >> ./src/trap && \
		echo "pass" >> ./test5


COPY	./run1 ./lib_bash
