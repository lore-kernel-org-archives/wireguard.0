Return-Path: luci@powerneth.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a5edec7
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 06:04:53 +0000 (UTC)
Received: from mail.intelterm.ro (174.15.122.86.static.cluj.rdsnet.ro
 [86.122.15.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7532211
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 06:04:52 +0000 (UTC)
Received: from [192.168.123.118] (unknown [188.24.107.151])
 by mail.intelterm.ro (Postfix) with ESMTPSA id D40992218C78
 for <wireguard@lists.zx2c4.com>; Tue, 26 Jun 2018 09:10:20 +0300 (EEST)
Subject: Re: src/crypto/curve25519-x86_64.h:1319: Error: no such instruction
 while compiling in centos 6
To: wireguard@lists.zx2c4.com
References: <CAK+ZqRryNNWq1yhAQKbzOxTKrzRmO_gfM47F18YCGOiYcdumdg@mail.gmail.com>
 <CAHmME9ooS8c-QmB6X_ySTZiYsK98vFQ-bpws6TJUUJ3sE-aCLQ@mail.gmail.com>
 <CAK+ZqRqA4BkCLmxnuNfRtNByXaDYv1MpZB44PZrCM_Mx_ncNRw@mail.gmail.com>
From: Lucian Cristian <luci@powerneth.ro>
Message-ID: <98b1fd4b-ebc9-b6b6-41e0-29a12e351335@powerneth.ro>
Date: Tue, 26 Jun 2018 09:10:20 +0300
MIME-Version: 1.0
In-Reply-To: <CAK+ZqRqA4BkCLmxnuNfRtNByXaDYv1MpZB44PZrCM_Mx_ncNRw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------F3C92CB7F4418C5F9FB74A22"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------F3C92CB7F4418C5F9FB74A22
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26.06.2018 05:57, karthik kumar wrote:
> Hi,
>   I did see the yum repo already being there RPMs available. But we 
> use only centos 6 and are desperately looking for alternate of 
> strongswan :(
> Is there any other suggestion for me, other than Centos 7 ? Is it 
> worth trying to rebuild the kernel with 8.1 gcc ? Is there an option 
> like /--without-elliptic-curve/ that I can use ?
>
> Thanks
>
> On Tue, Jun 26, 2018 at 5:58 AM Jason A. Donenfeld <Jason@zx2c4.com 
> <mailto:Jason@zx2c4.com>> wrote:
>
>     Hello,
>
>     Please use CentOS 7.
>
>     Jason
>
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

search the mailing list, I proposed a patch for centos 6, see if it's 
working, but you have to use elrepo kernels 
http://elrepo.org/linux/kernel/el6/x86_64/RPMS/


Regards


--------------F3C92CB7F4418C5F9FB74A22
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 26.06.2018 05:57, karthik kumar
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAK+ZqRqA4BkCLmxnuNfRtNByXaDYv1MpZB44PZrCM_Mx_ncNRw@mail.gmail.com">
      <div dir="ltr">Hi, 
        <div>  I did see the yum repo already being there RPMs
          available. But we use only centos 6 and are desperately
          looking for alternate of strongswan :(</div>
        <div>Is there any other suggestion for me, other than Centos 7 ?
          Is it worth trying to rebuild the kernel with 8.1 gcc ? Is
          there an option like <i>--without-elliptic-curve</i> that I
          can use ?<br>
          <div>
            <div><br>
            </div>
            <div>Thanks</div>
          </div>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr">On Tue, Jun 26, 2018 at 5:58 AM Jason A.
          Donenfeld &lt;<a href="mailto:Jason@zx2c4.com" target="_blank"
            moz-do-not-send="true">Jason@zx2c4.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello,<br>
          <br>
          Please use CentOS 7.<br>
          <br>
          Jason<br>
        </blockquote>
      </div>
      <!--'"--><br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
    <p>search the mailing list, I proposed a patch for centos 6, see if
      it's working, but you have to use elrepo kernels
      <a class="moz-txt-link-freetext" href="http://elrepo.org/linux/kernel/el6/x86_64/RPMS/">http://elrepo.org/linux/kernel/el6/x86_64/RPMS/</a></p>
    <p><br>
    </p>
    <p>Regards<br>
    </p>
  </body>
</html>

--------------F3C92CB7F4418C5F9FB74A22--
