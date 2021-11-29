Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C52C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Nov 2021 15:40:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3ceb3d0d;
	Mon, 29 Nov 2021 15:40:11 +0000 (UTC)
Received: from zeus.servers.mnus.de (zeus.servers.mnus.de [78.47.191.162])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 4bd4de68
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Nov 2021 00:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mnus.de;
 s=mnus.de-helios; t=1638145447;
 bh=lVD4XNYuL3CdgM+7BmL1oSo5FulGzQpTTPnkWkJE0HQ=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To;
 b=MUVk6qg9Q1Ou+aMzXqNUl+0mL4Fjd605/6RrKLIaRmcXbUn/0SEyN7BFeQkPLI+AQ
 H+fNcZ5j7j/bqIccSzuQium5GjAurH8htkwO2V7JEw1RsPrtIb30bm/TS9wP1l2PED
 omMSQu9MHLaeMzvbUhPvr+ocf2p9s/f1h0tr2+5odCtNOaOnEd4aoD3++0gb2zt5hG
 bF1YTG84NJqC7cRHWzs8bt+nC8GULR3hlMS6dDJAnHhjciyM41/ZRyC4+11u/ntYxB
 gJpuPUghT4h2bzCMSOqOcrHUAA1sGArqiQz+P+dnbCS/S0HaU4hplG7TOPWc5sELXN
 aGjip3m0klLQA/5/H7d+MkFgiaNKVRf/qhx3XwuVAqPgwM1snulM7sXzFfzrCsdwcT
 g0ldzHq+CtTKgfjPCcs3mkCEQkWj6WDFdC/zmy9fWqqaTOBdYJwRHzhS1MYtNSd5wc
 tsyVvRWKeXG/VzoiQ8MXZUAfA492RIK6GvwTzihbBGHUjQI6ehxR/KtKtFUa7v9Xn/
 6LO1G7xGZKwkFeUHlZjdpBW/MyeIzZGu6oy54o0OzL+bMRmQziLbBroGIhX3aJE0GZ
 QJA0FQqzAdeq0eUEA9xPfl2X0X1a6dhsmSGxL6DMJBJhxQPagCsrXfPV5dWGAtPVq1
 Sh+CCnUaLa5aZTUEcuLxi6EA=
Content-Type: multipart/mixed; boundary="------------NVLLliJN8PeMwNN7DKoDgWV8"
Message-ID: <d3d1d445-128e-9acb-b483-53b675fd9591@mnus.de>
Date: Mon, 29 Nov 2021 01:24:06 +0100
MIME-Version: 1.0
From: minus <minus+lists@mnus.de>
Subject: Re: wireguard-go fails to send/receive data
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20211123190331.101346-1-minus@mnus.de>
 <CAHmME9pEf9=6C3eAXfanftBt4LJ4viRszQc5oG3Jt9H7Fxd68A@mail.gmail.com>
 <fef7daf2-adf7-e042-4977-46fda04aa07d@mnus.de>
 <CAHmME9qMLM=HedzvADriiWLZXbo0yLoxt=Nk9B=PGcwY9kn0eg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHmME9qMLM=HedzvADriiWLZXbo0yLoxt=Nk9B=PGcwY9kn0eg@mail.gmail.com>
X-Mailman-Approved-At: Mon, 29 Nov 2021 15:40:07 +0000
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
--------------NVLLliJN8PeMwNN7DKoDgWV8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jason,

> I'm not seeing what could be causing this. Could you triple check that
> it really is busted on Debian 8?
I was mistaken, it has nothing to do with Debian 8 specifically. I could 
reproduce it on Arch as well.
When you bring up an interface via wireguard-go and start pinging 
there's a big chance that nothing at all will work starting with commit 
e3134bf6. I've attached a script to reproduce the problem. It doesn't 
always fail, so you may have to run it a few times.
--------------NVLLliJN8PeMwNN7DKoDgWV8
Content-Type: application/x-shellscript; name="repro.sh"
Content-Disposition: attachment; filename="repro.sh"
Content-Transfer-Encoding: base64

IyEvdXNyL2Jpbi9lbnYgYmFzaAoKc2V0IC1ldXgKCm1ha2Ugd2lyZWd1YXJkLWdvIHx8IGV4
aXQgMTI1CgppcCBuZXRucyBkZWwgdGVzdC1ucyB8fCB0cnVlCmlwIG5ldG5zIGFkZCB0ZXN0
LW5zCmlwIGxpbmsgYWRkIHRlc3Qta2VybmVsIHR5cGUgd2lyZWd1YXJkCndnIHNldCB0ZXN0
LWtlcm5lbCBsaXN0ZW4tcG9ydCAwIHByaXZhdGUta2V5IDwoZWNobyAiUU1DZlpjcDFLVTI3
a0VrcGNNQ2dBU0VqRG5EWkRZc2ZNTEhQZWQ3KzUzOD0iKSBwZWVyICJlRFBaSk1kZm5iOFpj
QS9WU1VuTFp2TEIyazhIVkgxMnVmQ0dhN1o3ckhJPSIgYWxsb3dlZC1pcHMgMTAuNTEuMjM0
LjEwLzMyCmlwIGxpbmsgc2V0IHRlc3Qta2VybmVsIG5ldG5zIHRlc3QtbnMgdXAKaXAgLW4g
dGVzdC1ucyBhZGRyIGFkZCAxMC41MS4yMzQuMS8yNCBkZXYgdGVzdC1rZXJuZWwKcG9ydD0k
KGlwIG5ldG5zIGV4ZWMgdGVzdC1ucyB3ZyBzaG93IHRlc3Qta2VybmVsIGxpc3Rlbi1wb3J0
KQoKaXAgbGluayBkZWwgdGVzdC1nbyB8fCB0cnVlCi4vd2lyZWd1YXJkLWdvIHRlc3QtZ28K
d2cgc2V0IHRlc3QtZ28gcHJpdmF0ZS1rZXkgPChlY2hvICJXQk03cWltUjN2RmsxUXRXTmZI
K0Y0Z2d5L2htTys1aGZJSEt4eEk0bkY0PSIpIHBlZXIgIituajlEa3FwbDRwaHNIbzJkUWxp
R201YUVpV0pKZ0J0WUtiaDdYamVOamc9IiBhbGxvd2VkLWlwcyAwLjAuMC4wLzAgZW5kcG9p
bnQgMTI3LjAuMC4xOiRwb3J0CmlwIGFkZHIgYWRkIDEwLjUxLjIzNC4xMC8yNCBkZXYgdGVz
dC1nbwppcCBsaW5rIHNldCB0ZXN0LWdvIHVwCgpwaW5nIC1jMiAtVzEgMTAuNTEuMjM0LjEK

--------------NVLLliJN8PeMwNN7DKoDgWV8--

