Return-Path: ds@fastmail.fm
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86e68169
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 10:53:10 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b01a03b5
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 10:53:10 +0000 (UTC)
Message-Id: <1511175481.615775.1178300464.09F18D48@webmail.messagingengine.com>
From: ds@fastmail.fm
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="_----------=_15111754816157752"
Subject: Re: disabling ipv6 with wg-quick
Date: Mon, 20 Nov 2017 11:58:01 +0100
References: <1510826689.1349863.1174432192.27EE87E6@webmail.messagingengine.com>
 <CAHmME9qvePERJzuUKXz+nMgd9rH2G9T2EkTbyfPO+8oonR+KoQ@mail.gmail.com>
In-Reply-To: <CAHmME9qvePERJzuUKXz+nMgd9rH2G9T2EkTbyfPO+8oonR+KoQ@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.

--_----------=_15111754816157752
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

Thanks, removing all ipv6 addresses from configs works. 

I was looking for a switch in wg-quick so I can use the same configs in
different networks but I work around this by editing the confs.
Thanks again.
 


On Thu, Nov 16, 2017, at 13:28, Jason A. Donenfeld wrote:
> Remove the v6 addresses from Address= and AllowedIPs=, and then
> you'll be set.> 
> --
> Sent from my telephone.
> 
> On Nov 16, 2017 11:04 AM,  <ds@fastmail.fm> wrote:
>> Hi,
>> 
>>  Is there a way to disable ipv6 when using wg-quick?
>> 
>>  If I have the following line on my conf file:
>> 
>>  Address = xx.xx.x.39/32,xxxx:xxxx:xxx:bb01::327/128
>> 
>>  wg-quick will fail with the following error:
>> 
>>   ~ 2   wg-quick up mullvad-se2
>>  [#] ip link add mullvad-se2 type wireguard
>>  [#] wg setconf mullvad-se2 /dev/fd/63
>>  [#] ip address add  xx.xx.x.39/3 dev mullvad-se2
>>  [#] ip address add xxxx:xxxx:xxx:bb01::327/128 dev mullvad-se2
>>  RTNETLINK answers: Permission denied
>> 
>>  I have ip6 disabled in my system.
>> 
>>  Removing xxxx:xxxx:xxx:bb01::327/128 works, but wg-quick still
>>  sets ups>>  some ipv6 routes `ip -6 ..` etc.
>> 
>>  Is there a way to use ipv4 only with wg-quick?
>> 
>>  Thanks.
>> 
>>  _______________________________________________
>>  WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard


--_----------=_15111754816157752
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="utf-8"

<!DOCTYPE html>
<html>
<head>
<title></title>
<style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style>
</head>
<body><div>Thanks, removing all ipv6 addresses from configs works. <br></div>
<div><br></div>
<div>I was looking for a switch in wg-quick so I can use the same configs in different networks but I work around this by editing the confs.<br></div>
<div><br>Thanks again.</div>
<div>&nbsp;<br></div>
<div><br></div>
<div><br></div>
<div>On Thu, Nov 16, 2017, at 13:28, Jason A. Donenfeld wrote:<br></div>
<blockquote type="cite"><div><div>Remove the v6 addresses from Address= and AllowedIPs=, and then you'll be set.<br></div>
<div><br></div>
<div><div>--<br></div>
<div>Sent from my telephone.<br></div>
</div>
</div>
<div><div><br></div>
<div defang_data-gmailquote="yes"><div>On Nov 16, 2017 11:04 AM,  &lt;<a href="mailto:ds@fastmail.fm">ds@fastmail.fm</a>&gt; wrote:<br></div>
<blockquote defang_data-gmailquote="yes" style="margin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204, 204, 204);padding-left:1ex;"><div>Hi,<br></div>
<div> <br></div>
<div> Is there a way to disable ipv6 when using wg-quick?<br></div>
<div> <br></div>
<div> If I have the following line on my conf file:<br></div>
<div> <br></div>
<div> Address = xx.xx.x.39/32,xxxx:xxxx:xxx:<wbr>bb01::327/128<br></div>
<div> <br></div>
<div> wg-quick will fail with the following error:<br></div>
<div> <br></div>
<div> &nbsp;~ 2&nbsp; &nbsp;wg-quick up mullvad-se2<br></div>
<div> [#] ip link add mullvad-se2 type wireguard<br></div>
<div> [#] wg setconf mullvad-se2 /dev/fd/63<br></div>
<div> [#] ip address add&nbsp; xx.xx.x.39/3 dev mullvad-se2<br></div>
<div> [#] ip address add xxxx:xxxx:xxx:bb01::327/128 dev mullvad-se2<br></div>
<div> RTNETLINK answers: Permission denied<br></div>
<div> <br></div>
<div> I have ip6 disabled in my system.<br></div>
<div> <br></div>
<div> Removing xxxx:xxxx:xxx:bb01::327/128 works, but wg-quick still sets ups<br></div>
<div> some ipv6 routes `ip -6 ..` etc.<br></div>
<div> <br></div>
<div> Is there a way to use ipv4 only with wg-quick?<br></div>
<div> <br></div>
<div> Thanks.<br></div>
<div> <br></div>
<div> ______________________________<wbr>_________________<br></div>
<div> WireGuard mailing list<br></div>
<div> <a href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><br></div>
<div> <a href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/<wbr>mailman/listinfo/wireguard</a><br></div>
</blockquote></div>
</div>
</blockquote><div><br></div>
</body>
</html>

--_----------=_15111754816157752--
