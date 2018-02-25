using System.Data;
using System;
using DAL;

namespace BAL
{
    public class BLayer
    {
        DLayer dl = new DLayer();
        
        //goto country
        public DataSet get_country()
        {
            DataSet ds = new DataSet();
            ds = dl.get_data("select * from ad_country");
            return ds;
        }

        //goto state
        public DataSet get_state(int country_id)
        {
            DataSet ds = new DataSet();
            ds = dl.get_data("select * from ad_state where country_id=" + country_id);
            return ds;
        }

        //goto city
        public DataSet get_city(int state_id)
        {
            DataSet ds = new DataSet();
            ds = dl.get_data("select * from ad_city where state_id=" + state_id);
            return ds;
        }

        public int get_city_id(string city)
        {
            int i = dl.get_id("select city_id from ad_city where city_name='" + city + "'");
            return i;
        }

        public int insert_city(int state_id, string city)
        {
            int i = dl.insert_update_data("insert into ad_city(state_id, city_name) values('" + state_id + ",'" + city + "')");
            return i;
        }

        public int update_city(int city_id, string city)
        {
            int i = dl.insert_update_data("update ad_city set city_name='" + city + "' where city_id=" + city_id);
            return i;
        }

        
        //goto country_code
        public DataSet get_country_code()
        {
            DataSet ds = new DataSet();
            ds = dl.get_data("select * from ad_country_code");
            return ds;
        }

        public int insert_country_code(string country_code, string country_name)
        {
            int i = dl.insert_update_data("insert into ad_country_code(country_code, country_name) values('" + country_code + "','" + country_name + "')");
            return i;
        }

        public int update_country_code(int country_code_id, string country_code, string country_name)
        {
            int i = dl.insert_update_data("update ad_country_code set country_code='" + country_code + "',country_name='" + country_name + "' where country_code_id=" + country_code_id);
            return i;
        }

        //goto post
        public DataSet get_post()
        {
            DataSet ds = new DataSet();
            ds = dl.get_data("select * from ad_post");
            return ds;
        }


        //goto registration
        public int insert_user(string fn, string ln, int country_id, int state_id, int city_id, int country_code_id, string mob_no, string gender, string email, string pswd)
        {
            int i = dl.insert_update_data("insert into registration(fn, ln, country_id, state_id, city_id, country_code_id, mob_no, gender, email, pswd) values('" + fn + "','" + ln + "'," + country_id + "," + state_id + "," + city_id + "," + country_code_id + ",'" + mob_no + "','" + gender + "','" + email + "','" + pswd + "')");
            return i;
        }

        public DataSet get_user_by_email(string email)
        {
            DataSet ds = dl.get_data("select * from registration where email='" + email + "'");
            return ds;
        }

        public DataSet get_user_by_reg_id(int reg_id)
        {
            DataSet ds = dl.get_data("select * from registration where reg_id=" + reg_id);
            return ds;
        }

        public DataSet get_user(string email, string pswd)
        {
            DataSet ds = dl.get_data("select * from registration where email='" + email + "' AND pswd='" + pswd + "'");
            return ds;
        }

        public DataSet get_all_user_by_key(int reg_id, string key)
        {
            DataSet ds = new DataSet();
            if (key != "")
            {
                ds = dl.get_data("select * from registration where reg_id<>" + reg_id + " AND (fn like ('" + key.ToString() + "%') OR ln like ('" + key.ToString() + "%'))");
            }
            else
            {
                ds = dl.get_data("select * from registration where 'a'!='a'");
            }
            return ds;
        }

        //goto profile
        public int insert_profile(int reg_id, string dob, int age, string designation, string qualification, string description, string profile_photo)
        {
            int i = dl.insert_update_data("insert into profile(reg_id, dob, age, designation, qualification, description, profile_photo) values("+ reg_id + ",'" + dob + "'," + age + ",'" + designation + "','" + qualification + "','" + description + "','" + profile_photo + "')");
            return i;
        }

        public int get_profile_id(int reg_id)
        {
            int i = dl.get_id("select profile_id from profile where reg_id=" + reg_id);
            return i;
        }

        public DataSet get_profile_by_reg_id(int reg_id)
        {
            DataSet ds = dl.get_data("select * from profile where reg_id=" + reg_id);
            return ds;
        }

        public DataSet get_profile_photo(int reg_id)
        {
            DataSet ds = dl.get_data("select profile_photo from profile where reg_id=" + reg_id);
            return ds;
        }

       

        //request
        public class Request
        {
            DLayer dl = new DLayer();
            //click on accept
            public int onClickAccept(int from_id, int to_id, int flag)
            {
                int i = dl.insert_update_data("update request set is_accepted=" + flag + " where from_id=" + from_id + " AND to_id=" + to_id);
                return i;
            }
            public int onClickReject(int from_id, int to_id)
            {
                int i = dl.insert_update_data("delete from request where (from_id=" + from_id + " AND to_id=" + to_id + ") OR (from_id=" + to_id + " AND to_id=" + from_id + ")");
                return i;
            }

            public DataSet getAllRequest(int to_id, int flag)
            {
                DataSet ds = dl.get_data("select from_id from request where to_id=" + to_id + " AND is_accepted=" + flag);
                return ds;
            }

            public DataSet isRequestAlreadySend(int from_id, int to_id)
            {
                DataSet ds = dl.get_data("select from_id, to_id from request where (from_id=" + from_id + " and to_id=" + to_id + ") OR  (from_id=" + to_id + " and to_id=" + from_id + ") ");
                return ds;
            }

        }
        
        public class Friend
        {
            DLayer dl = new DLayer();
            public int onClickAddFriend(int from_id, int to_id, int flag)
            {
                int i = dl.insert_update_data("insert into request (from_id, to_id, is_accepted) values(" + from_id + "," + to_id + "," + flag + ")");
                return i;
            }
            public int onClickCancel(int from_id, int to_id)
            {
                int i = dl.insert_update_data("delete from request where from_id=" + from_id + " AND to_id=" + to_id );
                return i;
            }
            public int onClickUnfriend(int from_id, int to_id)
            {
                int i = dl.insert_update_data("delete from request where (from_id=" + from_id + " AND to_id=" + to_id + ") OR (from_id=" + to_id + " AND to_id=" + from_id + ")");
                return i;
            }
            public DataSet getAllFriends(int reg_id, int flag)
            {
                DataSet ds = dl.get_data("select * from request where (to_id=" + reg_id + " OR from_id=" + reg_id + ") AND is_accepted=" + flag);
                return ds;
            }
        }
        public class Search
        {
            DLayer dl = new DLayer();
            BLayer bl = new BLayer();
            public DataTable getSearch(int reg_id, string key)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("friend_reg_id");
                dt.Columns.Add("friend_fn");
                dt.Columns.Add("friend_ln");
                dt.Columns.Add("friend_profile_photo");
                DataSet ds = bl.get_all_user_by_key(reg_id, key);

                foreach(DataRow dr in ds.Tables[0].Rows)
                {
                    int id = Convert.ToInt32(dr["reg_id"].ToString());
                    string fn = dr["fn"].ToString();
                    string ln = dr["ln"].ToString();
                   
                    DataSet ds1 = bl.get_profile_photo(id);
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        string image = ds1.Tables[0].Rows[0][0].ToString();
                        dt.Rows.Add(id, fn, ln, image);
                    }
                    else
                    {
                        dt.Rows.Add(id, fn, ln, "~/Lib/images/default_profile_photo.jpg");
                    }
                }
                return dt;
            }

        }

        public class MoreDetails
        {
            DLayer dl = new DLayer();
            BLayer bl = new BLayer();
            public DataTable getMoreDetails(int reg_id)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("friend_reg_id");
                dt.Columns.Add("friend_fn");
                dt.Columns.Add("friend_ln");
                dt.Columns.Add("gender");
                dt.Columns.Add("friend_profile_id");
                dt.Columns.Add("dob");
                dt.Columns.Add("description");
                dt.Columns.Add("friend_profile_photo");
                DataSet ds = bl.get_user_by_reg_id(reg_id);

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    string fn = dr["fn"].ToString();
                    string ln = dr["ln"].ToString();
                    string gender = dr["gender"].ToString();

                    DataSet ds1 = bl.get_profile_by_reg_id(reg_id);
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        string profile_id = ds1.Tables[0].Rows[0]["profile_id"].ToString();
                        string dob = ds1.Tables[0].Rows[0]["dob"].ToString();
                        string description = ds1.Tables[0].Rows[0]["description"].ToString();
                        string profile_photo = ds1.Tables[0].Rows[0]["profile_photo"].ToString();

                        dt.Rows.Add(reg_id, fn, ln, gender, profile_id, dob, description, profile_photo);
                    }
                    else
                    {
                        dt.Rows.Add(reg_id, fn, ln, gender, -1, "", "", "~/Lib/images/default_profile_photo.jpg");
                    }
                }
                return dt;
            }
        }

        public class Chat
        {
            DLayer dl = new DLayer();
            public int insert_msg(int from_id, int to_id, string msg, string date_time)
            {
                int i = dl.insert_update_data("insert into chat(from_id, to_id, msg, date_time) values(" + from_id + "," + to_id + ",'" + msg + "','" + date_time + "')");
                return i;
            }

            public DataSet get_msg_by_reg_id(int from_id, int to_id, string date, string time)
            {
                DataSet ds = dl.get_data("select * from chat where (from_id=" + from_id + " AND to_id=" + to_id + ") OR (from_id=" + to_id + " AND to_id=" + from_id + ")");
                return ds;
            }
            public void delete_msg(int from_id, int to_id, string date, string time)
            {
              //  dl.insert_update_data("delete from chat where ((from_id=" + from_id + " AND to_id=" + to_id + ") OR (from_id=" + to_id + " AND to_id=" + from_id + ")) AND (date_time NOT LIKE '%" + date + "%' AND date_time<'" + time + "')");

                dl.insert_update_data("delete from chat where ((from_id=" + from_id + " AND to_id=" + to_id + ") OR (from_id=" + to_id + " AND to_id=" + from_id + ")) AND date_time NOT LIKE '%" + date + "%'");
            }
        }

        public class Post
        {
            DLayer dl = new DLayer();
            public int add_post(int reg_id, string caption, string image, string date_time, int likes)
            {
                int i = dl.insert_update_data("insert into post(reg_id, caption, image, date_time, likes) values(" + reg_id + ",'" + caption + "','" + image + "','" + date_time + "'," + likes + ")");
                return i;
            }

            public int add_like_by_post_id(int post_id)
            {
                int i = dl.insert_update_data("update post set likes=(likes+1) where post_id=" + post_id);
                return i;
            }
            public DataSet get_post_by_reg_id(int reg_id)
            {
                DataSet ds = dl.get_data("select * from post where reg_id=" + reg_id);
                return ds;
            }

            public DataSet get_post_by_reg_id_filtered(int reg_id)
            {
                DataSet ds = dl.get_data("select r.fn, r.ln, p.post_id, p.caption, p.image, p.date_time from registration r,post p where p.reg_id=" + reg_id + " AND r.reg_id=p.reg_id");
                return ds;
            }
            public DataSet get_post_by_reg_id_array(int[] reg_id)
            {
                string query = "select * from post where reg_id in (";
                for(int i=0; i<reg_id.Length; i++)
                {
                    if (i > 0)
                    {
                         query += ", ";
                    }
                    query += query[i];
                }
                query += ")";
                DataSet ds = dl.get_data(query);
                return ds;

                //sring query = string.Format("SELECT * FROM myTable WHERE myColumn in ({0})", string.Join(", ", myArray));
            }
            public void delete_post_by_post_id(int post_id)
            {
                dl.insert_update_data("delete from post where post_id=" + post_id);
            }
        }
    }
}