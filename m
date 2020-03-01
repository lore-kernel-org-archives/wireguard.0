Return-Path: <SRS0=q7qE=4U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C8EC3F2D1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Mar 2020 23:13:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FD2520870
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Mar 2020 23:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FD2520870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=barrys-emacs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4327064;
	Tue, 3 Mar 2020 23:08:46 +0000 (UTC)
Received: from claranet-outbound-smtp02.uk.clara.net
 (claranet-outbound-smtp02.uk.clara.net [195.8.89.35])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72f27893
 for <wireguard@lists.zx2c4.com>; Sun, 1 Mar 2020 08:40:42 +0000 (UTC)
Received: from 92.40.171.114.threembb.co.uk ([92.40.171.114]:9988
 helo=[192.168.43.121])
 by relay02.mail.eu.clara.net (relay.clara.net [81.171.239.32]:10587)
 with esmtpsa (authdaemon_plain:barry@barrys-emacs.org)
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) id 1j8KDP-0001Sc-6h 
 (return-path <barry@barrys-emacs.org>); Sun, 01 Mar 2020 08:44:48 +0000
From: Barry Scott <barry@barrys-emacs.org>
Message-Id: <221C4F9E-5759-4E64-B019-593115357433@barrys-emacs.org>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: macOS Catalina failing https
Date: Sun, 1 Mar 2020 08:44:45 +0000
In-Reply-To: <CAAF+QM=2cF9nV2Fq-HbUrbFbNwzw51FqAcG6RBvXv-07YWmp5Q@mail.gmail.com>
To: Sean Baildon <sean@baildon.co>
References: <CAAF+QM=2cF9nV2Fq-HbUrbFbNwzw51FqAcG6RBvXv-07YWmp5Q@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-Mailman-Approved-At: Wed, 04 Mar 2020 00:08:45 +0100
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2893199919281396020=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============2893199919281396020==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_792C78B5-8C6D-40C0-AD75-5EC5219BB2E0"


--Apple-Mail=_792C78B5-8C6D-40C0-AD75-5EC5219BB2E0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 27 Feb 2020, at 16:46, Sean Baildon <sean@baildon.co> wrote:
>=20
> Hey,
>=20
> Recently purchased and upgraded a new MBP to Catalina.
>=20
> Requests to https enabled sites over the VPN no longer work, even
> using my old configuration. Requests to insecure sites=E2=80=94ex.
> http://example.com=E2=80=94work just fine.
>=20
> My iOS devices work as expected. I've tried using the iOS
> configurations on the laptop, but it's the same behaviour; hanging.
>=20
> I'm using the Mac App Store version of wireguard on a vanilla install
> of macOS Catalina. Are there any known issues? Happy to provide any
> useful debug

I like to use curl to find out the details of what is breaking.

This is the result of my testing using wireguard on macOS 10.15.3.
I connect wireguard via mobile data to my home router 172.16.4.1.
I change the Allowed IPs to include the IP of example.com:

Allowed IPS: 93.184.216.34/32, 172.16.2.0/24, 172.16.4.0/24

And used trace route to see if example.com <http://example.com/> was =
routed via
wireguard.


$ traceroute example.com
traceroute to example.com (93.184.216.34), 64 hops max, 52 byte packets
 1  172.16.4.1 (172.16.4.1)  108.362 ms  69.420 ms  61.568 ms

$ curl --verbose https://example.com
* Rebuilt URL to: https://example.com/
*   Trying 93.184.216.34...
* TCP_NODELAY set
* Connected to example.com (93.184.216.34) port 443 (#0)
* ALPN, offering http/1.1
* Cipher selection: =
ALL:!EXPORT:!EXPORT40:!EXPORT56:!aNULL:!LOW:!RC4:@STRENGTH
* successfully set certificate verify locations:
*   CAfile: /opt/local/share/curl/curl-ca-bundle.crt
  CApath: none
* TLSv1.2 (OUT), TLS header, Certificate Status (22):
* TLSv1.2 (OUT), TLS handshake, Client hello (1):
* TLSv1.2 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS handshake, Server key exchange (12):
* TLSv1.2 (IN), TLS handshake, Server finished (14):
* TLSv1.2 (OUT), TLS handshake, Client key exchange (16):
* TLSv1.2 (OUT), TLS change cipher, Client hello (1):
* TLSv1.2 (OUT), TLS handshake, Finished (20):
* TLSv1.2 (IN), TLS change cipher, Client hello (1):
* TLSv1.2 (IN), TLS handshake, Finished (20):
* SSL connection using TLSv1.2 / ECDHE-RSA-AES128-GCM-SHA256
* ALPN, server accepted to use http/1.1
* Server certificate:
*  subject: C=3DUS; ST=3DCalifornia; L=3DLos Angeles; O=3DInternet =
Corporation for Assigned Names and Numbers; OU=3DTechnology; =
CN=3Dwww.example.org
*  start date: Nov 28 00:00:00 2018 GMT
*  expire date: Dec  2 12:00:00 2020 GMT
*  subjectAltName: host "example.com" matched cert's "example.com"
*  issuer: C=3DUS; O=3DDigiCert Inc; CN=3DDigiCert SHA2 Secure Server CA
*  SSL certificate verify ok.
> GET / HTTP/1.1
> Host: example.com
> User-Agent: curl/7.60.0
> Accept: */*
>
< HTTP/1.1 200 OK
< Accept-Ranges: bytes
< Age: 485981
< Cache-Control: max-age=3D604800
< Content-Type: text/html; charset=3DUTF-8
< Date: Sun, 01 Mar 2020 08:36:35 GMT
< Etag: "3147526947"
< Expires: Sun, 08 Mar 2020 08:36:35 GMT
< Last-Modified: Thu, 17 Oct 2019 07:18:26 GMT
< Server: ECS (nyb/1D1E)
< Vary: Accept-Encoding
< X-Cache: HIT
< Content-Length: 1256
<
<!doctype html>
<html>
<head>
    <title>Example Domain</title>

    <meta charset=3D"utf-8" />
    <meta http-equiv=3D"Content-type" content=3D"text/html; =
charset=3Dutf-8" />
    <meta name=3D"viewport" content=3D"width=3Ddevice-width, =
initial-scale=3D1" />
    <style type=3D"text/css">
    body {
        background-color: #f0f0f2;
        margin: 0;
        padding: 0;
        font-family: -apple-system, system-ui, BlinkMacSystemFont, =
"Segoe UI", "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;

    }
    div {
        width: 600px;
        margin: 5em auto;
        padding: 2em;
        background-color: #fdfdff;
        border-radius: 0.5em;
        box-shadow: 2px 3px 7px 2px rgba(0,0,0,0.02);
    }
    a:link, a:visited {
        color: #38488f;
        text-decoration: none;
    }
    @media (max-width: 700px) {
        div {
            margin: 0 auto;
            width: auto;
        }
    }
    </style>
</head>

<body>
<div>
    <h1>Example Domain</h1>
    <p>This domain is for use in illustrative examples in documents. You =
may use this
    domain in literature without prior coordination or asking for =
permission.</p>
    <p><a href=3D"https://www.iana.org/domains/example">More =
information...</a></p>
</div>
</body>
</html>
* Connection #0 to host example.com left intact

Barry



--Apple-Mail=_792C78B5-8C6D-40C0-AD75-5EC5219BB2E0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 27 Feb 2020, at 16:46, Sean Baildon &lt;<a =
href=3D"mailto:sean@baildon.co" class=3D"">sean@baildon.co</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">Hey,<br class=3D""><br class=3D"">Recently purchased and =
upgraded a new MBP to Catalina.<br class=3D""><br class=3D"">Requests to =
https enabled sites over the VPN no longer work, even<br class=3D"">using =
my old configuration. Requests to insecure sites=E2=80=94ex.<br =
class=3D""><a href=3D"http://example.xn--comwork-416c" =
class=3D"">http://example.com=E2=80=94work</a> just fine.<br =
class=3D""><br class=3D"">My iOS devices work as expected. I've tried =
using the iOS<br class=3D"">configurations on the laptop, but it's the =
same behaviour; hanging.<br class=3D""><br class=3D"">I'm using the Mac =
App Store version of wireguard on a vanilla install<br class=3D"">of =
macOS Catalina. Are there any known issues? Happy to provide any<br =
class=3D"">useful debug<br class=3D""></div></div></blockquote><div><br =
class=3D""></div><div>I like to use curl to find out the details of what =
is breaking.</div><div><br class=3D""></div><div>This is the result of =
my testing using wireguard on macOS 10.15.3.</div><div>I connect =
wireguard via mobile data to my home router 172.16.4.1.</div><div>I =
change the Allowed IPs to include the IP of <a href=3D"http://example.com"=
 class=3D"">example.com</a>:</div><div><br class=3D""></div><div>Allowed =
IPS: 93.184.216.34/32, 172.16.2.0/24, 172.16.4.0/24</div><div><br =
class=3D""></div><div>And used trace route to see if <a =
href=3D"http://example.com" class=3D"">example.com</a>&nbsp;was routed =
via</div><div>wireguard.</div><div><br class=3D""></div><div><br =
class=3D""></div><div><div style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);"><div><b class=3D"">$ traceroute <a =
href=3D"http://example.com" class=3D"">example.com</a></b></div><div><b =
class=3D"">traceroute to <a href=3D"http://example.com" =
class=3D"">example.com</a> (93.184.216.34), 64 hops max, 52 byte =
packets</b></div><div><b class=3D"">&nbsp;1 &nbsp;172.16.4.1 =
(172.16.4.1) &nbsp;108.362 ms &nbsp;69.420 ms &nbsp;61.568 =
ms</b></div><div class=3D""><b class=3D""><br =
class=3D""></b></div></div></div><div><b class=3D"">$ curl --verbose <a =
href=3D"https://example.com" =
class=3D"">https://example.com</a></b></div><div><div><b class=3D"">* =
Rebuilt URL to: <a href=3D"https://example.com/" =
class=3D"">https://example.com/</a></b></div><div><b class=3D"">* &nbsp; =
Trying 93.184.216.34...</b></div><div><b class=3D"">* TCP_NODELAY =
set</b></div><div><b class=3D"">* Connected to <a =
href=3D"http://example.com" class=3D"">example.com</a> (93.184.216.34) =
port 443 (#0)</b></div><div><b class=3D"">* ALPN, offering =
http/1.1</b></div><div><b class=3D"">* Cipher selection: =
ALL:!EXPORT:!EXPORT40:!EXPORT56:!aNULL:!LOW:!RC4:@STRENGTH</b></div><div><=
b class=3D"">* successfully set certificate verify =
locations:</b></div><div><b class=3D"">* &nbsp; CAfile: =
/opt/local/share/curl/curl-ca-bundle.crt</b></div><div><b =
class=3D"">&nbsp; CApath: none</b></div><div><b class=3D"">* TLSv1.2 =
(OUT), TLS header, Certificate Status (22):</b></div><div><b class=3D"">* =
TLSv1.2 (OUT), TLS handshake, Client hello (1):</b></div><div><b =
class=3D"">* TLSv1.2 (IN), TLS handshake, Server hello =
(2):</b></div><div><b class=3D"">* TLSv1.2 (IN), TLS handshake, =
Certificate (11):</b></div><div><b class=3D"">* TLSv1.2 (IN), TLS =
handshake, Server key exchange (12):</b></div><div><b class=3D"">* =
TLSv1.2 (IN), TLS handshake, Server finished (14):</b></div><div><b =
class=3D"">* TLSv1.2 (OUT), TLS handshake, Client key exchange =
(16):</b></div><div><b class=3D"">* TLSv1.2 (OUT), TLS change cipher, =
Client hello (1):</b></div><div><b class=3D"">* TLSv1.2 (OUT), TLS =
handshake, Finished (20):</b></div><div><b class=3D"">* TLSv1.2 (IN), =
TLS change cipher, Client hello (1):</b></div><div><b class=3D"">* =
TLSv1.2 (IN), TLS handshake, Finished (20):</b></div><div><b class=3D"">* =
SSL connection using TLSv1.2 / =
ECDHE-RSA-AES128-GCM-SHA256</b></div><div><b class=3D"">* ALPN, server =
accepted to use http/1.1</b></div><div><b class=3D"">* Server =
certificate:</b></div><div><b class=3D"">* &nbsp;subject: C=3DUS; =
ST=3DCalifornia; L=3DLos Angeles; O=3DInternet Corporation for Assigned =
Names and Numbers; OU=3DTechnology; CN=3D<a =
href=3D"http://www.example.org" =
class=3D"">www.example.org</a></b></div><div><b class=3D"">* &nbsp;start =
date: Nov 28 00:00:00 2018 GMT</b></div><div><b class=3D"">* =
&nbsp;expire date: Dec &nbsp;2 12:00:00 2020 GMT</b></div><div><b =
class=3D"">* &nbsp;subjectAltName: host "<a href=3D"http://example.com" =
class=3D"">example.com</a>" matched cert's "<a href=3D"http://example.com"=
 class=3D"">example.com</a>"</b></div><div><b class=3D"">* &nbsp;issuer: =
C=3DUS; O=3DDigiCert Inc; CN=3DDigiCert SHA2 Secure Server =
CA</b></div><div><b class=3D"">* &nbsp;SSL certificate verify =
ok.</b></div><div><b class=3D"">&gt; GET / HTTP/1.1</b></div><div><b =
class=3D"">&gt; Host: <a href=3D"http://example.com" =
class=3D"">example.com</a></b></div><div><b class=3D"">&gt; User-Agent: =
curl/7.60.0</b></div><div><b class=3D"">&gt; Accept: =
*/*</b></div><div><b class=3D"">&gt;</b></div><div><b class=3D"">&lt; =
HTTP/1.1 200 OK</b></div><div><b class=3D"">&lt; Accept-Ranges: =
bytes</b></div><div><b class=3D"">&lt; Age: 485981</b></div><div><b =
class=3D"">&lt; Cache-Control: max-age=3D604800</b></div><div><b =
class=3D"">&lt; Content-Type: text/html; charset=3DUTF-8</b></div><div><b =
class=3D"">&lt; Date: Sun, 01 Mar 2020 08:36:35 GMT</b></div><div><b =
class=3D"">&lt; Etag: "3147526947"</b></div><div><b class=3D"">&lt; =
Expires: Sun, 08 Mar 2020 08:36:35 GMT</b></div><div><b class=3D"">&lt; =
Last-Modified: Thu, 17 Oct 2019 07:18:26 GMT</b></div><div><b =
class=3D"">&lt; Server: ECS (nyb/1D1E)</b></div><div><b class=3D"">&lt; =
Vary: Accept-Encoding</b></div><div><b class=3D"">&lt; X-Cache: =
HIT</b></div><div><b class=3D"">&lt; Content-Length: =
1256</b></div><div><b class=3D"">&lt;</b></div><div><b =
class=3D"">&lt;!doctype html&gt;</b></div><div><b =
class=3D"">&lt;html&gt;</b></div><div><b =
class=3D"">&lt;head&gt;</b></div><div><b class=3D"">&nbsp; &nbsp; =
&lt;title&gt;Example Domain&lt;/title&gt;</b></div><div><b class=3D""><br =
class=3D""></b></div><div><b class=3D"">&nbsp; &nbsp; &lt;meta =
charset=3D"utf-8" /&gt;</b></div><div><b class=3D"">&nbsp; &nbsp; =
&lt;meta http-equiv=3D"Content-type" content=3D"text/html; =
charset=3Dutf-8" /&gt;</b></div><div><b class=3D"">&nbsp; &nbsp; =
&lt;meta name=3D"viewport" content=3D"width=3Ddevice-width, =
initial-scale=3D1" /&gt;</b></div><div><b class=3D"">&nbsp; &nbsp; =
&lt;style type=3D"text/css"&gt;</b></div><div><b class=3D"">&nbsp; =
&nbsp; body {</b></div><div><b class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
background-color: #f0f0f2;</b></div><div><b class=3D"">&nbsp; &nbsp; =
&nbsp; &nbsp; margin: 0;</b></div><div><b class=3D"">&nbsp; &nbsp; =
&nbsp; &nbsp; padding: 0;</b></div><div><b class=3D"">&nbsp; &nbsp; =
&nbsp; &nbsp; font-family: -apple-system, system-ui, BlinkMacSystemFont, =
"Segoe UI", "Open Sans", "Helvetica Neue", Helvetica, Arial, =
sans-serif;</b></div><div><b class=3D""><br class=3D""></b></div><div><b =
class=3D"">&nbsp; &nbsp; }</b></div><div><b class=3D"">&nbsp; &nbsp; div =
{</b></div><div><b class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; width: =
600px;</b></div><div><b class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; margin: =
5em auto;</b></div><div><b class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
padding: 2em;</b></div><div><b class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
background-color: #fdfdff;</b></div><div><b class=3D"">&nbsp; &nbsp; =
&nbsp; &nbsp; border-radius: 0.5em;</b></div><div><b class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; box-shadow: 2px 3px 7px 2px =
rgba(0,0,0,0.02);</b></div><div><b class=3D"">&nbsp; &nbsp; =
}</b></div><div><b class=3D"">&nbsp; &nbsp; a:link, a:visited =
{</b></div><div><b class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; color: =
#38488f;</b></div><div><b class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
text-decoration: none;</b></div><div><b class=3D"">&nbsp; &nbsp; =
}</b></div><div><b class=3D"">&nbsp; &nbsp; @media (max-width: 700px) =
{</b></div><div><b class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; div =
{</b></div><div><b class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
margin: 0 auto;</b></div><div><b class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; width: auto;</b></div><div><b class=3D"">&nbsp; &nbsp; =
&nbsp; &nbsp; }</b></div><div><b class=3D"">&nbsp; &nbsp; =
}</b></div><div><b class=3D"">&nbsp; &nbsp; =
&lt;/style&gt;</b></div><div><b class=3D"">&lt;/head&gt;</b></div><div><b =
class=3D""><br class=3D""></b></div><div><b =
class=3D"">&lt;body&gt;</b></div><div><b =
class=3D"">&lt;div&gt;</b></div><div><b class=3D"">&nbsp; &nbsp; =
&lt;h1&gt;Example Domain&lt;/h1&gt;</b></div><div><b class=3D"">&nbsp; =
&nbsp; &lt;p&gt;This domain is for use in illustrative examples in =
documents. You may use this</b></div><div><b class=3D"">&nbsp; &nbsp; =
domain in literature without prior coordination or asking for =
permission.&lt;/p&gt;</b></div><div><b class=3D"">&nbsp; &nbsp; =
&lt;p&gt;&lt;a href=3D"<a href=3D"https://www.iana.org/domains/example" =
class=3D"">https://www.iana.org/domains/example</a>"&gt;More =
information...&lt;/a&gt;&lt;/p&gt;</b></div><div><b =
class=3D"">&lt;/div&gt;</b></div><div><b =
class=3D"">&lt;/body&gt;</b></div><div><b =
class=3D"">&lt;/html&gt;</b></div><div><b class=3D"">* Connection #0 to =
host <a href=3D"http://example.com" class=3D"">example.com</a> left =
intact</b></div><div><b class=3D""><br class=3D""></b></div><div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);">Barry</div><div class=3D""><br class=3D""></div></div><div><br =
class=3D""></div></div></div></body></html>=

--Apple-Mail=_792C78B5-8C6D-40C0-AD75-5EC5219BB2E0--

--===============2893199919281396020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2893199919281396020==--
