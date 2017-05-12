Return-Path: carroarmato0@inuits.eu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f0384c4
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 May 2017 14:35:37 +0000 (UTC)
Received: from zimbra.inuits.be (mail.inuits.eu [88.151.241.2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69d9b5ce
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 May 2017 14:35:37 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.inuits.be (Postfix) with ESMTP id B29314013B
 for <wireguard@lists.zx2c4.com>; Fri, 12 May 2017 16:46:23 +0200 (CEST)
Received: from zimbra.inuits.be ([127.0.0.1])
 by localhost (zimbra.inuits.be [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRJ5NgybhRla for <wireguard@lists.zx2c4.com>;
 Fri, 12 May 2017 16:46:22 +0200 (CEST)
Received: from [10.0.42.51] (d54c71dba.static.telenet.be [84.199.29.186])
 by zimbra.inuits.be (Postfix) with ESMTPSA id B139740139
 for <wireguard@lists.zx2c4.com>; Fri, 12 May 2017 16:46:22 +0200 (CEST)
Subject: Re: Wireguard on Centos 7
To: wireguard@lists.zx2c4.com
References: <8a2eb5ef-f154-ecff-e080-57b9a63d1bce@inuits.eu>
 <CAHmME9pJf1RP_0C1VrqHzEnqaNrAx4XH8snYaAH_h2xJdO3tGw@mail.gmail.com>
 <156af131-eeda-9f34-90e0-ebc70a994e95@inuits.eu>
 <c48d3e67-f818-8854-1f18-41e0c68cd538@createc.ro>
From: Christophe Vanlancker <carroarmato0@inuits.eu>
Message-ID: <b01c0754-b1df-a0ee-23d4-72c5b3e5267a@inuits.eu>
Date: Fri, 12 May 2017 16:46:22 +0200
MIME-Version: 1.0
In-Reply-To: <c48d3e67-f818-8854-1f18-41e0c68cd538@createc.ro>
Content-Type: multipart/alternative;
 boundary="------------CF4FE5D45EFC803042BBBC5B"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------CF4FE5D45EFC803042BBBC5B
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Lucian, that did the trick.


Regards,

Christophe


On 12-05-17 15:15, Lucian Cristian wrote:
> On 12.05.2017 12:47, Christophe Vanlancker wrote:
>> I haven't done this kind of work but I'll try giving it a shot. :)
>>
>>
>> Christophe
>>
>>
>> On 12-05-17 11:38, Jason A. Donenfeld wrote:
>>> Centos's 3.10 is not kernel.org's 3.10. They patch it heavily. If
>>> you'd like to adjust compat.h to support centos's patched-up kernel,
>>> without breaking support for other kernels, feel free to submit a
>>> patch.
>>>
>>> Jason
>>
> Or use the elrepo rpm repositorykernels
>
>
> regards
>
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

-- 
-- 
Christophe Vanlancker <christophe.vanlancker@inuits.eu>
+32 (494) 232277 | Linux & Open-Source consultant - Inuits.eu


--------------CF4FE5D45EFC803042BBBC5B
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Thanks Lucian, that did the trick.</p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Christophe<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 12-05-17 15:15, Lucian Cristian
      wrote:<br>
    </div>
    <blockquote
      cite="mid:c48d3e67-f818-8854-1f18-41e0c68cd538@createc.ro"
      type="cite">
      <meta content="text/html; charset=windows-1252"
        http-equiv="Content-Type">
      <div class="moz-cite-prefix">On 12.05.2017 12:47, Christophe
        Vanlancker wrote:<br>
      </div>
      <blockquote
        cite="mid:156af131-eeda-9f34-90e0-ebc70a994e95@inuits.eu"
        type="cite">I haven't done this kind of work but I'll try giving
        it a shot. :) <br>
        <br>
        <br>
        Christophe <br>
        <br>
        <br>
        On 12-05-17 11:38, Jason A. Donenfeld wrote: <br>
        <blockquote type="cite">Centos's 3.10 is not kernel.org's 3.10.
          They patch it heavily. If <br>
          you'd like to adjust compat.h to support centos's patched-up
          kernel, <br>
          without breaking support for other kernels, feel free to
          submit a <br>
          patch. <br>
          <br>
          Jason <br>
        </blockquote>
        <br>
      </blockquote>
      <p>Or use the elrepo rpm <span style="color: rgb(84, 84, 84);
          font-family: arial, sans-serif; font-size: small; font-style:
          normal; font-variant-ligatures: normal; font-variant-caps:
          normal; font-weight: normal; letter-spacing: normal; orphans:
          2; text-align: left; text-indent: 0px; text-transform: none;
          white-space: normal; widows: 2; word-spacing: 0px;
          -webkit-text-stroke-width: 0px; background-color: rgb(255,
          255, 255); text-decoration-style: initial;
          text-decoration-color: initial; display: inline !important;
          float: none;">repository<span class="Apple-converted-space"> </span></span>kernels</p>
      <p><br>
      </p>
      <p>regards<br>
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
    <pre class="moz-signature" cols="72">-- 
-- 
Christophe Vanlancker <a class="moz-txt-link-rfc2396E" href="mailto:christophe.vanlancker@inuits.eu">&lt;christophe.vanlancker@inuits.eu&gt;</a>
+32 (494) 232277 | Linux &amp; Open-Source consultant - Inuits.eu </pre>
  </body>
</html>

--------------CF4FE5D45EFC803042BBBC5B--
