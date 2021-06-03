Return-Path: <SRS0=c5tI=K5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MIME_HEADER_CTYPE_ONLY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21661C47082
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Jun 2021 19:30:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07249613E4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Jun 2021 19:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07249613E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=53c70r.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7024f48;
	Thu, 3 Jun 2021 19:30:45 +0000 (UTC)
Received: from 53c70r.de (53c70r.de [45.142.177.54])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 08c2e082
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 3 Jun 2021 19:30:43 +0000 (UTC)
Subject: Re: WireGuard responses a Handshake Initiation packet with another
 Handshake Initiation instead of Handshake Response
DKIM-Filter: OpenDKIM Filter v2.11.0 53c70r.de 8E7C743401B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=53c70r.de; s=mail;
 t=1622748642; bh=VzkpKGCMSwCWyNfDJctcIyyPTOF3g8gC9fKz8PnG1gc=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=MMQSVfguysze3x7CnB984zsA1Sxn5cRijswtHqu5kbN4pG3wOV18iwauzPb2P0t0c
 vCsvRAl9mEBUGArzrydbJhwkc+wGg7M9jiEzMPSoPo/Y/Xaotb4gEIuRhU1YrRixQe
 UiUrfBz1ZensCxaMH5MDnSMfY0CzQLhoLd3dYiHM=
To: wireguard@lists.zx2c4.com
References: <CA+O7g7c-XunYp0J+XWMQDEyCb=3vahgX2JaPEM-CYThvt6Ltig@53c70r.de>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@gmail.com>
From: Silvan Nagl <mail@53c70r.de>
Message-ID: <852812b5-9210-5c70-7cef-d673967d568a@53c70r.de>
Date: Thu, 3 Jun 2021 21:30:39 +0200
In-Reply-To: <CA+O7g7c-XunYp0J+XWMQDEyCb=3vahgX2JaPEM-CYThvt6Ltig@53c70r.de>
Content-Type: multipart/mixed; boundary="------------7DFA0A83B6EDF66413452332"
Content-Language: en-US
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--------------7DFA0A83B6EDF66413452332
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Reproducible:

Client_a <-> Gateway_a <-> Internet <-> Server_b

When Gateway_a changes its WAN-IP Client_a loses connection.
Capture files show the state after the IP change.

On 6/3/21 8:43 AM, Arınç ÜNAL wrote:
> I tried wg syncconf wg0 <(wg-quick strip wg0) without success.
>
> Only restarting wireguard by systemctl restart wg-quick@wg0 makes it
> respond with a Handshake Response packet.
>
> This happens really rarely and especially on OpenWrt 19.07 as a client.
>
> Other clients can handshake properly while the server fails to
> complete the handshake for the OpenWrt device.
>
> Packet Captures on boths sides are in the attachments.
>
> Server:
> 5.9.0-0.bpo.5-amd64 #1 SMP Debian 5.9.15-1~bpo10+1 (2020-12-31) x86_64 GNU/Linux
> wireguard-tools v1.0.20210223 - https://git.zx2c4.com/wireguard-tools/
> wireguard-dkms/buster-backports,now 1.0.20210219-1~bpo10+1
>
> Client:
> 4.14.221 #0 SMP Mon Feb 15 15:22:37 2021 armv7l GNU/Linux
> wireguard-tools v1.0.20191226 - https://git.zx2c4.com/wireguard-tools/
> kmod-wireguard 4.14.221+1.0.20200611-2
>
> Arınç Ü.

--------------7DFA0A83B6EDF66413452332
Content-Type: application/vnd.tcpdump.pcap;
 name="server.pcap"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="server.pcap"

1MOyoQIABAAAAAAAAAAAAAAABAABAAAAGo6vYKh4CQC+AAAAvgAAACa7ubTV6yxr9aB3wAgA
RQAAsIk5AAA6EQGzT+/GnS2OsTaK0cpsAJzzqwEAAADH2OW1J4dcm75G4QwmB2fnz0+58cZO
3LfPozYBMnn2uQHacgPoGA4SPPjASMaRvHCeoVoODNof794RKJExq8O+u6xvZQQahd/8CTIC
wu9/ZAFgiW00DWmVK/TLTQPjw7zz1glJwSyzfJLtp4kvhqepdfou9brZyX3PWpRp00AJGgAA
AAAAAAAAAAAAAAAAAAAfjq9g/UoLAL4AAAC+AAAAJru5tNXrLGv1oHfACABFAACwjNUAADoR
/hZP78adLY6xNorRymwAnNjzAQAAACz5Fn+4TVWjc76dWMXwc9lR1UeByr0SZm+bz8oX7y5Y
7ZoiM5L/4+YfiJGl1UaF6nstlGmAm1cqtmDOlSo++xZM6nf1tNIh3ktKzpRH2aYtnjijWwku
LWrMItfEkekT8cpb81ggnx29Zk3AWUuaylMyTL6gV59PcToLmc8KFAkMAAAAAAAAAAAAAAAA
AAAAACWOr2DIxgEAvgAAAL4AAAAmu7m01essa/Wgd8AIAEUAALCQMAAAOhH6u0/vxp0tjrE2
itHKbACcVsYBAAAAthcOM5LAL7cRduYso6DkrYoTHuATI6OUWayjna6AGC2AQV4fAWZYqx0I
bdav/XWdN5s2Ghqx6ibsldp2rthfV08Z+QWNfXgGr6iGldFPPrt5F/kIsePtyGQJrVCy7euR
tDXlUwLpctw0u0MV5NHEsqOnr9dP8R7kzcp2Kgg6bJcAAAAAAAAAAAAAAAAAAAAAKo6vYNib
AwC+AAAAvgAAACa7ubTV6yxr9aB3wAgARQAAsJQ7AAA6EfawT+/GnS2OsTaK0cpsAJzsNgEA
AABc4iNt/ZVrnqaSa0tsgOfUEiasdq/bYL5APwb4LvCCGuYKmwI8d55/ulgpXon0hayR4A4v
v/YK/nj4SMUG7GJPoh2APkr6QuCKCoc9JwYegNgXxqu/pj5X4AGMRcaVIo4mTkVfhzWhsJZD
hCojWoPsm4Z1/9yFJU7LEQZCo/LySgAAAAAAAAAAAAAAAAAAAAAvjq9gG1YJAL4AAAC+AAAA
Jru5tNXrLGv1oHfACABFAACwla4AADoR9T1P78adLY6xNorRymwAnOq3AQAAAJbpYwybR09y
BxtlUJIykAgdIVMIG/bOmcGeQczWKgTTyx+jTBantJwZx0EDmozqdIUA6UEqgRcrPwBnarHd
7Tx+glgoqZpWWvneuZvng13ES3OVnmqMNWMZAX/VlzBh0OB+x+NcVuYfhrqXiVHdPVeM6MSA
kjGYAQH74ryqWYfKAAAAAAAAAAAAAAAAAAAAAA==
--------------7DFA0A83B6EDF66413452332
Content-Type: application/vnd.tcpdump.pcap;
 name="client.pcap"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="client.pcap"

1MOyoQIABAAAAAAAAAAAAAAABAABAAAAzRv5UKOMCAC+AAAAvgAAAHz/Teedx2gnGaU/EAgA
RYgAsIf+AABAEcg1wKiKFC2OsTaK0cpsAJwqLwEAAADjWMvROLPwb9YtYl42lqL0YO2QJLAG
+abV5oo/G1/G2ymOwzakE/G8GmBK/rcgvKShQMDzfhCJDbvq8HO2v6CLFnkhd8uDVnJhkDlS
+qpOjejXKX9kHJI9rokK14BxQfdxldNRyJwgjbqD6D0G8P5OmDE4H6YCzvmXr65RvVoy3wAA
AAAAAAAAAAAAAAAAAADSG/lQS2EKAL4AAAC+AAAAfP9N553HaCcZpT8QCABFiACwiTkAAEAR
xvrAqIoULY6xNorRymwAnCovAQAAAMfY5bUnh1ybvkbhDCYHZ+fPT7nxxk7ct8+jNgEyefa5
AdpyA+gYDhI8+MBIxpG8cJ6hWg4M2h/v3hEokTGrw767rG9lBBqF3/wJMgLC739kAWCJbTQN
aZUr9MtNA+PDvPPWCUnBLLN8ku2niS+Gp6l1+i71utnJfc9alGnTQAkaAAAAAAAAAAAAAAAA
AAAAANcb+VBVNgwAvgAAAL4AAAB8/03nncdoJxmlPxAIAEWIALCM1QAAQBHDXsCoihQtjrE2
itHKbACcKi8BAAAALPkWf7hNVaNzvp1YxfBz2VHVR4HKvRJmb5vPyhfvLljtmiIzkv/j5h+I
kaXVRoXqey2UaYCbVyq2YM6VKj77Fkzqd/W00iHeS0rOlEfZpi2eOKNbCS4taswi18SR6RPx
ylvzWCCfHb1mTcBZS5rKUzJMvqBXn09xOguZzwoUCQwAAAAAAAAAAAAAAAAAAAAA3Rv5UIiw
AgC+AAAAvgAAAHz/Teedx2gnGaU/EAgARYgAsJAwAABAEcADwKiKFC2OsTaK0cpsAJwqLwEA
AAC2Fw4zksAvtxF25iyjoOStihMe4BMjo5RZrKOdroAYLYBBXh8BZlirHQht1q/9dZ03mzYa
GrHqJuyV2nau2F9XTxn5BY19eAavqIaV0U8+u3kX+Qix4+3IZAmtULLt65G0NeVTAuly3DS7
QxXk0cSyo6ev10/xHuTNynYqCDpslwAAAAAAAAAAAAAAAAAAAADiG/lQToUEAL4AAAC+AAAA
fP9N553HaCcZpT8QCABFiACwlDsAAEARu/jAqIoULY6xNorRymwAnCovAQAAAFziI239lWue
ppJrS2yA59QSJqx2r9tgvkA/Bvgu8IIa5gqbAjx3nn+6WCleifSFrJHgDi+/9gr+ePhIxQbs
Yk+iHYA+SvpC4IoKhz0nBh6A2BfGq7+mPlfgAYxFxpUijiZORV+HNaGwlkOEKiNag+ybhnX/
3IUlTssRBkKj8vJKAAAAAAAAAAAAAAAAAAAAAOcb+VD8QQoAvgAAAL4AAAB8/03nncdoJxml
PxAIAEWIALCVrgAAQBG6hcCoihQtjrE2itHKbACcKi8BAAAAluljDJtHT3IHG2VQkjKQCB0h
Uwgb9s6ZwZ5BzNYqBNPLH6NMFqe0nBnHQQOajOp0hQDpQSqBFys/AGdqsd3tPH6CWCipmlZa
+d65m+eDXcRLc5Weaow1YxkBf9WXMGHQ4H7H41xW5h+GupeJUd09V4zoxICSMZgBAfvivKpZ
h8oAAAAAAAAAAAAAAAAAAAAA
--------------7DFA0A83B6EDF66413452332--
