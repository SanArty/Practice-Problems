class Problem6
{
    public static void main (String args[])
    {
        int a;
        int b;
        int c;
        if(a>b)
        {
            if(a>c)
            {
                if(b>c)
                {   
                    max=a;
                    min=c;
                    mid=b;
                }
                else
                {
                    max=a;
                    min=b;
                    mid=c;
                }
            }
            else
            {
                max=c;
                min=b;
                mid=a;
            }
        }
        else
        {
            if(b<c)
            {
                max=c;
                min=a;
                mid=b;
            }
            else
            {
                if(a<c)
                {
                    max=b;
                    min=a;
                    mid=c;  
                }
        
                else
                {
                    max=b;
                    min=c;
                    mid=a;
                }
            } 
        }
    }
}