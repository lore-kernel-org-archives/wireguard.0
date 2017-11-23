Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd7485a8
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Nov 2017 12:22:35 +0000 (UTC)
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
 [209.85.216.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ff02017
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Nov 2017 12:22:35 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id 33so18843310qtv.1
 for <wireguard@lists.zx2c4.com>; Thu, 23 Nov 2017 04:27:49 -0800 (PST)
MIME-Version: 1.0
Sender: nicolas.prochazka@gmail.com
In-Reply-To: <CAHmME9rng4iyqHmWVB3HbizD-7bvRZQUe_Zhc-LHo-vaiz5D2A@mail.gmail.com>
References: <CADdae-gxRdskDLWaHhGF8otRDV4ps_VQ4qfabw9njLRnnYNNmQ@mail.gmail.com>
 <CAHmME9rng4iyqHmWVB3HbizD-7bvRZQUe_Zhc-LHo-vaiz5D2A@mail.gmail.com>
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Thu, 23 Nov 2017 13:27:49 +0100
Message-ID: <CADdae-g0+P4OU2WTZwqhFr8iGUApu1JS68OWbvUUEkj4r2xtWA@mail.gmail.com>
Subject: Re: about high availibity
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

ok and thanks
nicolas<div id="DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2"><br /> <table
style="border-top: 1px solid #D3D4DE;">
	<tr>
      <td style="width: 55px; padding-top: 18px;"><a
href="https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail"
target="_blank"><img
src="https://ipmcdn.avast.com/images/icons/icon-envelope-tick-round-orange-animated-no-repeat-v1.gif"
alt="" width="46" height="29" style="width: 46px; height: 29px;"
/></a></td>
		<td style="width: 470px; padding-top: 17px; color: #41424e;
font-size: 13px; font-family: Arial, Helvetica, sans-serif;
line-height: 18px;">Garanti sans virus. <a
href="https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail"
target="_blank" style="color: #4453ea;">www.avast.com</a> 		</td>
	</tr>
</table>
<a href="#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2" width="1" height="1"></a></div>

2017-11-23 12:52 GMT+01:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> Hi Nicolas,
>
> You can't change that parameter, and I won't ever add that option.
> This isn't negotiable.
>
> However, I'll at some point be adding netlink event notifications, so
> that you learn when WireGuard itself has detected connectivity
> problems (usually in about 15 seconds), and react accordingly.
>
> Jason
