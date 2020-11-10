%本程序为块匹配算法的快速搜索策略，菱形搜索法，也叫钻石搜索法

function [MotionVector,count]=DiamondSearch(cur,refer,N) 
window=7; 
[H,W]=size(cur); 
BH=H/N; 
BW=W/N; 
MotionVector=cell(BH,BW); 
count=zeros(BH,BW); 
for m=1:BH 
    for n=1:BW 
       % m,n 
        oi=(m-1)*N+1;  %
        oj=(n-1)*N+1; 
        lower=max(oi-window,1); 
        upper=min(oi+window,H-(N-1)); 
        left=max(oj-window,1); 
        right=min(oj+window,W-(N-1)); 
        p=oi; 
        q=oj; 
        i=1; 
        %1:(p-2,q) 
        if p-2>=lower 
            value(i,:)=[MMB(oi,oj,p-2,q,cur,refer,N),1]; 
            i=i+1; 
            count(m,n)=count(m,n)+1; 
        end 
        %2:(p-1,q-1) 
        if p-1>=lower & q-1>=left 
            value(i,:)=[MMB(oi,oj,p-1,q-1,cur,refer,N),2]; 
            i=i+1; 
            count(m,n)=count(m,n)+1; 
        end 
        %3:(p-1,q+1) 
        if p-1>=lower & q+1<=right 
            value(i,:)=[MMB(oi,oj,p-1,q+1,cur,refer,N),3]; 
            i=i+1; 
            count(m,n)=count(m,n)+1; 
        end 
        %4:(p,q-2) 
        if q-2>=left 
            value(i,:)=[MMB(oi,oj,p,q-2,cur,refer,N),4]; 
            i=i+1; 
            count(m,n)=count(m,n)+1; 
        end 
        %5:(p,q) 
        value(i,:)=[MMB(oi,oj,p,q,cur,refer,N),5]; 
        i=i+1; 
        count(m,n)=count(m,n)+1; 
        %6:(p,q+2) 
        if q+2<=right 
            value(i,:)=[MMB(oi,oj,p,q+2,cur,refer,N),6]; 
            i=i+1; 
            count(m,n)=count(m,n)+1; 
        end 
        %7:(p+1,q-1) 
        if p+1<=upper & q-1>=left 
            value(i,:)=[MMB(oi,oj,p+1,q-1,cur,refer,N),7]; 
            i=i+1; 
            count(m,n)=count(m,n)+1; 
        end 
        %8:(p+1,q+1) 
        if p+1<=upper & q+1<=right 
            value(i,:)=[MMB(oi,oj,p+1,q+1,cur,refer,N),8]; 
            i=i+1; 
            count(m,n)=count(m,n)+1; 
        end 
        %9:(p+2,q) 
        if p+2<=upper 
            value(i,:)=[MMB(oi,oj,p+2,q,cur,refer,N),9]; % 
            i=i+1; 
            count(m,n)=count(m,n)+1; 
        end 
        [Y,index]=min(value(:,1)); 
        while value(index,2)~=5 
            switch value(index,2) 
            case 1 
                clear value; 
                j=1; 
                value(j,:)=[Y,5]; 
                j=j+1; 
                p=p-2; 
                if q+2<=right 
                    value(j,:)=[MMB(oi,oj,p,q+2,cur,refer,N),6]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if q-2>=left 
                    value(j,:)=[MMB(oi,oj,p,q-2,cur,refer,N),4]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p-1>=lower & q+1<=right 
                    value(j,:)=[MMB(oi,oj,p-1,q+1,cur,refer,N),3]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p-1>=lower & q-1>=left 
                    value(j,:)=[MMB(oi,oj,p-1,q-1,cur,refer,N),2]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p-2>=lower 
                    value(j,:)=[MMB(oi,oj,p-2,q,cur,refer,N),1]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
            case 2 
                clear value; 
                j=1; 
                value(j,:)=[Y,5]; 
                j=j+1; 
                p=p-1; 
                q=q-1; 
                if q-2>=left 
                    value(j,:)=[MMB(oi,oj,p,q-2,cur,refer,N),4]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p-1>=lower & q-1>=left 
                    value(j,:)=[MMB(oi,oj,p-1,q-1,cur,refer,N),2]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p-2>=lower 
                    value(j,:)=[MMB(oi,oj,p-2,q,cur,refer,N),1]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
            case 3 
                clear value; 
                j=1; 
                value(j,:)=[Y,5]; 
                j=j+1; 
                p=p-1; 
                q=q+1; 
                if q+2<=right 
                    value(j,:)=[MMB(oi,oj,p,q+2,cur,refer,N),6]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p-1>=lower & q+1<=right 
                    value(j,:)=[MMB(oi,oj,p-1,q+1,cur,refer,N),3]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p-2>=lower 
                    value(j,:)=[MMB(oi,oj,p-2,q,cur,refer,N),1]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
            case 4 
                clear value; 
                j=1; 
                value(j,:)=[Y,5]; 
                j=j+1; 
                q=q-2; 
                if p+2<=upper 
                    value(j,:)=[MMB(oi,oj,p+2,q,cur,refer,N),9]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p+1<=upper & q-1>=left 
                    value(j,:)=[MMB(oi,oj,p+1,q-1,cur,refer,N),7]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if q-2>=left 
                    value(j,:)=[MMB(oi,oj,p,q-2,cur,refer,N),4]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p-1>=lower & q-1>=left 
                    value(j,:)=[MMB(oi,oj,p-1,q-1,cur,refer,N),2]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p-2>=lower 
                    value(j,:)=[MMB(oi,oj,p-2,q,cur,refer,N),1]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
            case 6 
                clear value; 
                j=1; 
                value(j,:)=[Y,5]; 
                j=j+1; 
                q=q+2; 
                if p-2>=lower 
                    value(j,:)=[MMB(oi,oj,p-2,q,cur,refer,N),1]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p-1>=lower & q+1<=right 
                    value(j,:)=[MMB(oi,oj,p-1,q+1,cur,refer,N),3]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if q+2<=right 
                    value(j,:)=[MMB(oi,oj,p,q+2,cur,refer,N),6]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p+1<=upper & q+1<=right 
                    value(j,:)=[MMB(oi,oj,p+1,q+1,cur,refer,N),8]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p+2<=upper 
                    value(j,:)=[MMB(oi,oj,p+2,q,cur,refer,N),9]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
            case 7 
                clear value; 
                j=1; 
                value(j,:)=[Y,5]; 
                j=j+1; 
                p=p+1; 
                q=q-1; 
                if q-2>=left 
                    value(j,:)=[MMB(oi,oj,p,q-2,cur,refer,N),4]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p+1<=upper & q-1>=left 
                    value(j,:)=[MMB(oi,oj,p+1,q-1,cur,refer,N),7]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p+2<=upper 
                    value(j,:)=[MMB(oi,oj,p+2,q,cur,refer,N),9]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
            case 8 
                clear value; 
                j=1; 
                value(j,:)=[Y,5]; 
                j=j+1; 
                p=p+1; 
                q=q+1; 
                if q+2<=right 
                    value(j,:)=[MMB(oi,oj,p,q+2,cur,refer,N),6]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p+1<=upper & q+1<=right 
                    value(j,:)=[MMB(oi,oj,p+1,q+1,cur,refer,N),8]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p+2<=upper 
                    value(j,:)=[MMB(oi,oj,p+2,q,cur,refer,N),9]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
            case 9 
                clear value; 
                j=1; 
                value(j,:)=[Y,5]; 
                j=j+1; 
                p=p+2; 
                if q-2>=left 
                    value(j,:)=[MMB(oi,oj,p,q-2,cur,refer,N),4]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if q+2<=right 
                    value(j,:)=[MMB(oi,oj,p,q+2,cur,refer,N),6]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p+1<=upper & q-1>=left 
                    value(j,:)=[MMB(oi,oj,p+1,q-1,cur,refer,N),7]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p+1<=upper & q+1<=right 
                    value(j,:)=[MMB(oi,oj,p+1,q+1,cur,refer,N),8]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
                if p+2<=upper 
                    value(j,:)=[MMB(oi,oj,p+2,q,cur,refer,N),9]; 
                    j=j+1; 
                    count(m,n)=count(m,n)+1; 
                end 
            otherwise 
            end 
            [Y,index]=min(value(:,1)); 
        end 
        k=1; 
        if p-1>=lower 
            final(k,:)=[MMB(oi,oj,p-1,q,cur,refer,N),1]; 
            k=k+1; 
            count(m,n)=count(m,n)+1; 
        end 
        if q-1>=left 
            final(k,:)=[MMB(oi,oj,p,q-1,cur,refer,N),2]; 
            k=k+1; 
            count(m,n)=count(m,n)+1; 
        end 
        if q+1<=right 
            final(k,:)=[MMB(oi,oj,p,q+1,cur,refer,N),3]; 
            k=k+1; 
            count(m,n)=count(m,n)+1; 
        end 
        if p+1<=upper 
            final(k,:)=[MMB(oi,oj,p+1,q,cur,refer,N),4]; 
            k=k+1; 
            count(m,n)=count(m,n)+1; 
        end 
        final(k,:)=[Y,5]; 
        [Y,index]=min(final(:,1)); 
        switch final(index,2) 
        case 1 
            vi=p-1-oi; 
            vj=q-oj; 
        case 2 
            vi=p-oi; 
            vj=q-1-oj; 
        case 3 
            vi=p-oi; 
            vj=q+1-oj; 
        case 4 
            vi=p+1-oi; 
            vj=q-oj; 
        case 5 
            vi=p-oi; 
            vj=q-oj; 
        otherwise 
        end 
        clear final 
        MotionVector{m,n}=[vi,vj]; 
        clear value 
    end 
end  
 
