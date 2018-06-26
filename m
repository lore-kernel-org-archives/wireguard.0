Return-Path: s.gottschall@dd-wrt.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f77311d1
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 13:27:01 +0000 (UTC)
Received: from webmail.newmedia-net.de (smtps.newmedia-net.de
 [IPv6:2a05:a1c0:0:de::167])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25814c09
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 13:27:01 +0000 (UTC)
Subject: Re: src/crypto/curve25519-x86_64.h:1319: Error: no such instruction
 while compiling in centos 6
To: wireguard@lists.zx2c4.com
References: <CAK+ZqRryNNWq1yhAQKbzOxTKrzRmO_gfM47F18YCGOiYcdumdg@mail.gmail.com>
 <CAHmME9ooS8c-QmB6X_ySTZiYsK98vFQ-bpws6TJUUJ3sE-aCLQ@mail.gmail.com>
 <CAK+ZqRqA4BkCLmxnuNfRtNByXaDYv1MpZB44PZrCM_Mx_ncNRw@mail.gmail.com>
 <98b1fd4b-ebc9-b6b6-41e0-29a12e351335@powerneth.ro>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <620f1385-aaaf-8057-611b-794ecbd661eb@dd-wrt.com>
Date: Tue, 26 Jun 2018 15:32:29 +0200
MIME-Version: 1.0
In-Reply-To: <98b1fd4b-ebc9-b6b6-41e0-29a12e351335@powerneth.ro>
Content-Type: multipart/alternative;
 boundary="------------C191864A5C701D510CA06A92"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------C191864A5C701D510CA06A92
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

try at least gcc 6 minimum. i dont know which kernel is used in centos 
6. lowest kernel version i tested is 3.10


Sebastian


Am 26.06.2018 um 08:10 schrieb Lucian Cristian:
> On 26.06.2018 05:57, karthik kumar wrote:
>> Hi,
>>   I did see the yum repo already being there RPMs available. But we 
>> use only centos 6 and are desperately looking for alternate of 
>> strongswan :(
>> Is there any other suggestion for me, other than Centos 7 ? Is it 
>> worth trying to rebuild the kernel with 8.1 gcc ? Is there an option 
>> like /--without-elliptic-curve/ that I can use ?
>>
>> Thanks
>>
>> On Tue, Jun 26, 2018 at 5:58 AM Jason A. Donenfeld <Jason@zx2c4.com 
>> <mailto:Jason@zx2c4.com>> wrote:
>>
>>     Hello,
>>
>>     Please use CentOS 7.
>>
>>     Jason
>>
>>
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
> search the mailing list, I proposed a patch for centos 6, see if it's 
> working, but you have to use elrepo kernels 
> http://elrepo.org/linux/kernel/el6/x86_64/RPMS/
>
>
> Regards
>
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--------------C191864A5C701D510CA06A92
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>try at least gcc 6 minimum. i dont know which kernel is used in
      centos 6. lowest kernel version i tested is 3.10</p>
    <p><br>
    </p>
    <p>Sebastian<br>
    </p>
    <br>
    <div class="moz-cite-prefix">Am 26.06.2018 um 08:10 schrieb Lucian
      Cristian:<br>
    </div>
    <blockquote type="cite"
      cite="mid:98b1fd4b-ebc9-b6b6-41e0-29a12e351335@powerneth.ro">
      <div class="moz-cite-prefix">On 26.06.2018 05:57, karthik kumar
        wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CAK+ZqRqA4BkCLmxnuNfRtNByXaDYv1MpZB44PZrCM_Mx_ncNRw@mail.gmail.com">
        <div dir="ltr">Hi, 
          <div>  I did see the yum repo already being there RPMs
            available. But we use only centos 6 and are desperately
            looking for alternate of strongswan :(</div>
          <div>Is there any other suggestion for me, other than Centos 7
            ? Is it worth trying to rebuild the kernel with 8.1 gcc ? Is
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
            Donenfeld &lt;<a href="mailto:Jason@zx2c4.com"
              target="_blank">Jason@zx2c4.com</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello,<br>
            <br>
            Please use CentOS 7.<br>
            <br>
            Jason<br>
          </blockquote>
        </div>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <br>
        <pre wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
      </blockquote>
      <p>search the mailing list, I proposed a patch for centos 6, see
        if it's working, but you have to use elrepo kernels <a
          class="moz-txt-link-freetext"
          href="http://elrepo.org/linux/kernel/el6/x86_64/RPMS/">http://elrepo.org/linux/kernel/el6/x86_64/RPMS/</a></p>
      <p><br>
      </p>
      <p>Regards<br>
      </p>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------C191864A5C701D510CA06A92--
