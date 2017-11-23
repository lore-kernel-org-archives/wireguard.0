Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ea86ed5
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Nov 2017 11:43:06 +0000 (UTC)
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
 [209.85.220.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2447e72f
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Nov 2017 11:43:06 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id o6so20607819qkh.3
 for <wireguard@lists.zx2c4.com>; Thu, 23 Nov 2017 03:48:21 -0800 (PST)
MIME-Version: 1.0
Sender: nicolas.prochazka@gmail.com
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Thu, 23 Nov 2017 12:48:20 +0100
Message-ID: <CADdae-gxRdskDLWaHhGF8otRDV4ps_VQ4qfabw9njLRnnYNNmQ@mail.gmail.com>
Subject: about high availibity
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,
latest handshake seems to be a convinient way to determine if
wireguard tunnel is up or down, to manage a high availibity for server
side.
Now, it seems latest handshame must > 135 s to be sure that tunnel is
down, how can we specify a small delay, as 30s for example.

Regards,
Nicolas Prochazka.
<div id="DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2"><br /> <table
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
