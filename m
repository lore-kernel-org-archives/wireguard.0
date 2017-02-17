Return-Path: samuel@sholland.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ea57c43
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 04:48:40 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1830b947
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 04:48:40 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5FD682094F
 for <wireguard@lists.zx2c4.com>; Thu, 16 Feb 2017 23:48:57 -0500 (EST)
Received: from [192.168.1.101] (97-64-215-195.client.mchsi.com [97.64.215.195])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0693024377
 for <wireguard@lists.zx2c4.com>; Thu, 16 Feb 2017 23:48:56 -0500 (EST)
Subject: Re: Instability during large transfers
To: wireguard@lists.zx2c4.com
References: <7a3a5f6d-1eb5-ef32-097e-e24c2f9d2805@sholland.org>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <05adeaed-20ff-ce42-b8c6-73bbc55d7021@sholland.org>
Date: Thu, 16 Feb 2017 22:48:56 -0600
MIME-Version: 1.0
In-Reply-To: <7a3a5f6d-1eb5-ef32-097e-e24c2f9d2805@sholland.org>
Content-Type: multipart/mixed; boundary="------------C5C87425E915515E45EEBA13"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------C5C87425E915515E45EEBA13
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/16/17 12:38, Samuel Holland wrote:
> I will enable netconsole on the firewall now that I can hopefully
> reproduce the panic, but since the networking setup there is rather
> complicated (vlans on top of bridges) I'm not sure if I will get all
> of the panic messages.

Success! I reproduced the panic and got full logs.

I ran:
$ ssh <server> cat /dev/zero | dd of=/dev/null bs=4096 status=progress
108295966720 bytes (108 GB, 101 GiB) copied, 17437 s, 6.2 MB/s
packet_write_wait: Connection to <server> port 22: Broken pipe

26440386+4 records in
26440386+4 records out
108299829248 bytes (108 GB, 101 GiB) copied, 18413 s, 5.9 MB/s

Attached is the extended netconsole output from the firewall.

Hope this helps,
Samuel

--------------C5C87425E915515E45EEBA13
Content-Type: application/gzip;
 name="wireguardpanic.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="wireguardpanic.gz"

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
X746e/RfeVlCpKAwAAA=
--------------C5C87425E915515E45EEBA13--
