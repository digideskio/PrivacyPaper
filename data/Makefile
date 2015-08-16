
TARGETS=access_home_t.txt days_sum.txt days_all.txt days_sorted.txt weeks/all.txt

all: ${TARGETS}



# filter only access to ?node=home
# and convert time to local time
access_home_t.txt: wiki_sanitized.access
	./extract.sh $? access_home > $@

# calculate number of requests for each week day
days_sum.txt: access_home_t.txt 
	cat $? | awk -F "|" '{print $$4 $$3}' | sort -n | uniq -c > $@

# calculate access time relative to 00:00:00 at the same day
days_all.txt: access_home_t.txt 
	./extract.sh $? days_all > $@

# (sort the result for cumulative distribution)
days_sorted.txt: days_all.txt
	cat $? | awk '{print $$2}' | sort -n > $@

# for every week, collect all requests from Sun-Sat
weeks/all.txt: access_home_t.txt 
	rm -rf weeks/
	mkdir -p weeks/
	./extract.sh $? weeks_all > weeks/all.txt
	./extract.sh weeks/all.txt weeks weeks/

clean: 
	rm -f ${TARGETS}
	rm -f weeks/*
	rm -d -f weeks


