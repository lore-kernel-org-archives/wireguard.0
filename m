Return-Path: <SRS0=WErI=2X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,MISSING_HEADERS,NORMAL_HTTP_TO_IP,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,WEIRD_PORT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FB9C2D0DD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Jan 2020 07:37:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3690121655
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Jan 2020 07:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3690121655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=attglobal.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 853dc026;
	Thu, 2 Jan 2020 07:37:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27276e8c
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 07:37:13 +0000 (UTC)
Received: from p-impout001.msg.pkvw.co.charter.net
 (p-impout008aa.msg.pkvw.co.charter.net [47.43.26.139])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b52022f0
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 07:37:13 +0000 (UTC)
Received: from [192.168.0.2] ([76.91.204.161]) by cmsmtp with ESMTP
 id muzjiK4S99Wkdmuzkikkku; Thu, 02 Jan 2020 07:34:12 +0000
X-Authority-Analysis: v=2.3 cv=R6x95uZX c=1 sm=1 tr=0
 a=rO8gbEbqGp3jIVlhlq3uIg==:117 a=rO8gbEbqGp3jIVlhlq3uIg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=9cW_t1CCXrUA:10 a=r77TgQKjGQsHNAKrUKIA:9
 a=07d9gI8wAAAA:8 a=mHFh7uMkAAAA:8 a=aceowhZSAAAA:8 a=xP1ufChRAAAA:8
 a=UGG5zPGqAAAA:8 a=pGLkceISAAAA:8 a=mo-ROI2qYSJBS8ft5UAA:9
 a=2YwTu29lzFk70W2d:21 a=Ju2yCjyKIccRHO_p:21 a=QEXdDO2ut3YA:10
 a=bTZ3FDUYaMkA:10 a=1SC-I_OoR3IA:10 a=UNj90DokZAQA:10 a=qiWi7Edwir4A:10
 a=69WVnREnm1wA:10 a=NWVoK91CQyQA:10 a=S5G5rcVzBIwTvdc5o6_T:22
 a=0-dW2UBFgGQgl3lKmnmz:22 a=rN39HnRHHxo1ujNAtu8A:9 a=nUV6o9oh5Fm-HdTZ:21
 a=S-mUx0qdK4o1nSCD:21 a=fVeYFg_Evns0nvuG:21 a=_W_S_7VecoQA:10
 a=1FFeGIo4sIMA:10 a=RPAUK0fq2fAA:10 a=e2CUPOnPG4QKp8I52DXD:22
 a=HQEt9TzzOQq8o8QOxM_l:22 a=NMZokWJXTV_zCymGmvQm:22 a=SuU39FtTVyGER4vBZ3Sa:22
 a=17ibUXfGiVyGqR_YBevW:22
Subject: Re: wg-quick: syntax error, unexpected saddr
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <b3fb12ff-969a-9037-ee6f-f8e4b6d91895@attglobal.net>
 <CAPRZce10tz0KgBUMFcHj09WDvUF_ygpMBQckB-Nebnjk52479g@mail.gmail.com>
From: Eddie <stunnel@attglobal.net>
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <3d6ae658-2184-5da2-ddaa-c4060419bee5@attglobal.net>
Date: Wed, 1 Jan 2020 23:34:11 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAPRZce10tz0KgBUMFcHj09WDvUF_ygpMBQckB-Nebnjk52479g@mail.gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfGZ/OT4+1CJyWt7XYIGkMVZ/i3FC8ZotieS5oSEMOl1F0ewfk4Z8kNJ7oc7HvO8YcCa+D12K3GJ8SkPxdenC3dvoe3U1TFTKZIojerb4YuHBiRcDrZ8o
 dXgnAAwLhDAxPoGeO6qSe0uL0nrqHdXIPl3CRHcpyGXxuhSnAeC9Fi5QqReZK2nFYse7XTCe6iD0+g==
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: stunnel@attglobal.net
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1699203881308470919=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============1699203881308470919==
Content-Type: multipart/alternative;
 boundary="------------B90D5AD9BCC511A0A5C64C96"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B90D5AD9BCC511A0A5C64C96
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Ha.  Even older:

root@The-Tardis:~# nft -v
nftables v0.6 (Support Edward Snowden)


And in reply to a couple of off-list messages:

wireguard-tools-1.0.20191226

There are different reasons for using different VPNs.  Can you really 
"totally" trust the one that you're using.

Cheers.



On 1/1/2020 10:22 PM, Edward Vielmetti wrote:
> Eddie - what version of nftables does Slackware come with? The output 
> of `nft -v` should be helpful.
>
> There is a report from stackexchange that nftables at 0.7 gives this 
> error, but at 0.8.1 or better it's OK. I was not easily able to verify 
> that from the source code, but it would be where I'd start to look. 
> There was
>
> The nftables 0.8.1 release notes (from 2018) are here: 
> https://lwn.net/Articles/744480/ and it points to new syntax in this 
> release.
>
> good luck!
>
> Ed
>
> On Thu, Jan 2, 2020 at 12:27 AM Eddie <stunnel@attglobal.net 
> <mailto:stunnel@attglobal.net>> wrote:
>
>     First time running wireguard as a native client on my Slackware 14.2
>     system throws this:
>
>     root@The-Tardis:~# wg-quick up wg0
>     [#] ip link add wg0 type wireguard
>     [#] wg setconf wg0 /dev/fd/63
>     [#] ip -4 address add 192.168.150.14/32 <http://192.168.150.14/32>
>     dev wg0
>     [#] ip link set mtu 1420 up dev wg0
>     [#] wg set wg0 fwmark 51820
>     [#] ip -4 route add 0.0.0.0/0 <http://0.0.0.0/0> dev wg0 table 51820
>     [#] ip -4 rule add not fwmark 51820 table 51820
>     [#] ip -4 rule add table main suppress_prefixlength 0
>     [#] sysctl -q net.ipv4.conf.all.src_valid_mark=1
>     [#] nft -f /dev/fd/63
>     /dev/fd/63:5:76-80: Error: syntax error, unexpected saddr
>
>     Fairly simple config to connect to my VPS:
>
>     [Interface]
>     Address = 192.168.150.14/32 <http://192.168.150.14/32>
>     PrivateKey = <Not the key you're looking for>
>
>     [Peer]
>     PublicKey = <Just being overly paranoid>
>     Endpoint = www.xxx.yyy.zzz:51820
>     AllowedIPs = 0.0.0.0/0 <http://0.0.0.0/0>
>
>     Not sure what additional information you need collected at this point.
>
>     I'm able to connect outbound successfully using NordVPN's version of
>     wireguard, but that doesn't use wg-quick, which is where the issue is.
>
>     Cheers.
>     _______________________________________________
>     WireGuard mailing list
>     WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>
>     https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
>
> -- 
> Edward Vielmetti +1 734 330 2465
> edward.vielmetti@gmail.com <mailto:edward.vielmetti@gmail.com>
>


--------------B90D5AD9BCC511A0A5C64C96
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Ha.  Even older:<br>
    <br>
    root@The-Tardis:~# nft -v<br>
    nftables v0.6 (Support Edward Snowden)<br>
    <br>
    <br>
    And in reply to a couple of off-list messages:<br>
    <br>
    wireguard-tools-1.0.20191226<br>
    <br>
    There are different reasons for using different VPNs.  Can you
    really "totally" trust the one that you're using.<br>
    <br>
    Cheers.<br>
    <br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 1/1/2020 10:22 PM, Edward Vielmetti
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAPRZce10tz0KgBUMFcHj09WDvUF_ygpMBQckB-Nebnjk52479g@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Eddie - what version of nftables does Slackware
        come with? The output of `nft -v` should be helpful.
        <div><br>
        </div>
        <div>There is a report from stackexchange that nftables at 0.7
          gives this error, but at 0.8.1 or better it's OK. I was not
          easily able to verify that from the source code, but it would
          be where I'd start to look. There was </div>
        <div><br>
        </div>
        <div>The nftables 0.8.1 release notes (from 2018) are here: <a
            href="https://lwn.net/Articles/744480/"
            moz-do-not-send="true">https://lwn.net/Articles/744480/</a> and
          it points to new syntax in this release.</div>
        <div><br>
        </div>
        <div>good luck!</div>
        <div><br>
        </div>
        <div>Ed</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Thu, Jan 2, 2020 at 12:27
          AM Eddie &lt;<a href="mailto:stunnel@attglobal.net"
            moz-do-not-send="true">stunnel@attglobal.net</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">First
          time running wireguard as a native client on my Slackware 14.2
          <br>
          system throws this:<br>
          <br>
          root@The-Tardis:~# wg-quick up wg0<br>
          [#] ip link add wg0 type wireguard<br>
          [#] wg setconf wg0 /dev/fd/63<br>
          [#] ip -4 address add <a href="http://192.168.150.14/32"
            rel="noreferrer" target="_blank" moz-do-not-send="true">192.168.150.14/32</a>
          dev wg0<br>
          [#] ip link set mtu 1420 up dev wg0<br>
          [#] wg set wg0 fwmark 51820<br>
          [#] ip -4 route add <a href="http://0.0.0.0/0"
            rel="noreferrer" target="_blank" moz-do-not-send="true">0.0.0.0/0</a>
          dev wg0 table 51820<br>
          [#] ip -4 rule add not fwmark 51820 table 51820<br>
          [#] ip -4 rule add table main suppress_prefixlength 0<br>
          [#] sysctl -q net.ipv4.conf.all.src_valid_mark=1<br>
          [#] nft -f /dev/fd/63<br>
          /dev/fd/63:5:76-80: Error: syntax error, unexpected saddr<br>
          <br>
          Fairly simple config to connect to my VPS:<br>
          <br>
          [Interface]<br>
          Address = <a href="http://192.168.150.14/32" rel="noreferrer"
            target="_blank" moz-do-not-send="true">192.168.150.14/32</a><br>
          PrivateKey = &lt;Not the key you're looking for&gt;<br>
          <br>
          [Peer]<br>
          PublicKey = &lt;Just being overly paranoid&gt;<br>
          Endpoint = <a class="moz-txt-link-abbreviated" href="http://www.xxx.yyy.zzz:51820">www.xxx.yyy.zzz:51820</a><br>
          AllowedIPs = <a href="http://0.0.0.0/0" rel="noreferrer"
            target="_blank" moz-do-not-send="true">0.0.0.0/0</a><br>
          <br>
          Not sure what additional information you need collected at
          this point.<br>
          <br>
          I'm able to connect outbound successfully using NordVPN's
          version of <br>
          wireguard, but that doesn't use wg-quick, which is where the
          issue is.<br>
          <br>
          Cheers.<br>
          _______________________________________________<br>
          WireGuard mailing list<br>
          <a href="mailto:WireGuard@lists.zx2c4.com" target="_blank"
            moz-do-not-send="true">WireGuard@lists.zx2c4.com</a><br>
          <a href="https://lists.zx2c4.com/mailman/listinfo/wireguard"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><br>
        </blockquote>
      </div>
      <br clear="all">
      <div><br>
      </div>
      -- <br>
      <div dir="ltr" class="gmail_signature">Edward Vielmetti +1 734 330
        2465
        <div><a href="mailto:edward.vielmetti@gmail.com" target="_blank"
            moz-do-not-send="true">edward.vielmetti@gmail.com</a></div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------B90D5AD9BCC511A0A5C64C96--

--===============1699203881308470919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1699203881308470919==--
