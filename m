Return-Path: <SRS0=TwOG=MV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AA3C64EAD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 10:23:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5052D21479
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 10:23:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="r5Clv7Vc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5052D21479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pobox.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eeb205e3;
	Tue, 9 Oct 2018 10:22:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3103f592
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 10:22:30 +0000 (UTC)
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95e5505d
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 10:22:30 +0000 (UTC)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 9D90E22399
 for <wireguard@lists.zx2c4.com>; Tue,  9 Oct 2018 06:23:22 -0400 (EDT)
 (envelope-from b.candler@pobox.com)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type; s=sasl; bh=xUj+gSDBGcZ+GfjUVqIC/WryzQQ=; b=r5Clv7
 Vcvr5hoKKvw9llk1gsGbnDIdVMpJJgw+qm8ynVZOcdnjeUQK+lFsF9K4wnldoPG7
 N5hrB2vzvV6MG+YYLMRT+XwcXodn0xd8s5q1IzyeJt58F9s6gaK1sY87oKA1bjPc
 UMMfv5n9VCR79L/97A+T9yodCUoALaMVCqxWE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=pobox.com; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type; q=dns; s=sasl; b=bIuy/zi3qo3TlA75V0Qy0wa5IGRYe1Ml
 Ocmx9zsnGHN7CwrlCD6UcSe1D7+8DggCbSrG36bsaqLJNA9mgEOsjgD82wuMkNQG
 6uYrWfdDBx/hh+Yqbi06bhaf+/oQUu+Ia5bMshsp5nEXEqUOa8rOy7G9RxWALUgX
 iIHFNAza6bw=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 970CB22398
 for <wireguard@lists.zx2c4.com>; Tue,  9 Oct 2018 06:23:22 -0400 (EDT)
 (envelope-from b.candler@pobox.com)
Received: from MacBook-Pro-3.local (unknown [84.92.42.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id D74F322396
 for <wireguard@lists.zx2c4.com>; Tue,  9 Oct 2018 06:23:19 -0400 (EDT)
 (envelope-from b.candler@pobox.com)
Subject: Re: about wireguard-go
To: wireguard@lists.zx2c4.com
References: <mailman.1.1539079201.20756.wireguard@lists.zx2c4.com>
From: Brian Candler <b.candler@pobox.com>
Message-ID: <15a2d91b-74e6-49f9-5ea8-f6f51294e4af@pobox.com>
Date: Tue, 9 Oct 2018 11:23:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <mailman.1.1539079201.20756.wireguard@lists.zx2c4.com>
Content-Language: en-US
X-Pobox-Relay-ID: 57F6AF9E-CBAD-11E8-84F1-CC883AD79A78-28021239!pb-smtp21.pobox.com
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
Content-Type: multipart/mixed; boundary="===============4724465260195749307=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============4724465260195749307==
Content-Type: multipart/alternative;
 boundary="------------097ED90345A09D501DECC15C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------097ED90345A09D501DECC15C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2018 11:00, wireguard-request@lists.zx2c4.com wrote:
> In fact :
>
> [nicolas@linux wireguard-go-0.0.20180613]$ printf 'package main\nconst
> UseTheKernelModuleInstead = 0xdeadbabe\n' > ireallywantobuildon_linux.go
> [nicolas@linux wireguard-go-0.0.20180613]$ make
> Makefile:7: *** Do not build this for Linux. Instead use the Linux kernel
> module. See wireguard.com/install/ for more info..  Stop.

Look in the Makefile 
<https://github.com/WireGuard/wireguard-go/blob/master/Makefile>:

ifeq ($(shell go env GOOS),linux)
ifeq ($(wildcard .git),)
$(error Do not build this for Linux. Instead use the Linux kernel 
module. See wireguard.com/install/ for more info.)
else
$(shell printf 'package main\nconst UseTheKernelModuleInstead = 
0xdeadbabe\n' > ireallywantobuildon_linux.go)
endif
endif

Also see 
https://www.gnu.org/software/make/manual/html_node/Wildcard-Function.html

It looks like you need to move the .git directory out of the way before 
you build - or just modify the Makefile. And you shouldn't need to 
manually create ireallywantobuildon_linux.go, because the Makefile does 
it for you.


--------------097ED90345A09D501DECC15C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 09/10/2018 11:00,
      <a class="moz-txt-link-abbreviated" href="mailto:wireguard-request@lists.zx2c4.com">wireguard-request@lists.zx2c4.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:mailman.1.1539079201.20756.wireguard@lists.zx2c4.com">
      <pre wrap="">In fact :

[nicolas@linux wireguard-go-0.0.20180613]$ printf 'package main\nconst
UseTheKernelModuleInstead = 0xdeadbabe\n' &gt; ireallywantobuildon_linux.go
[nicolas@linux wireguard-go-0.0.20180613]$ make
Makefile:7: *** Do not build this for Linux. Instead use the Linux kernel
module. See wireguard.com/install/ for more info..  Stop.</pre>
    </blockquote>
    <p>Look in the <a moz-do-not-send="true"
        href="https://github.com/WireGuard/wireguard-go/blob/master/Makefile">Makefile</a>:</p>
    <p>ifeq ($(shell go env GOOS),linux)<br>
      ifeq ($(wildcard .git),)<br>
      $(error Do not build this for Linux. Instead use the Linux kernel
      module. See wireguard.com/install/ for more info.)<br>
      else<br>
      $(shell printf 'package main\nconst UseTheKernelModuleInstead =
      0xdeadbabe\n' &gt; ireallywantobuildon_linux.go)<br>
      endif<br>
      endif</p>
    <p>Also see
<a class="moz-txt-link-freetext" href="https://www.gnu.org/software/make/manual/html_node/Wildcard-Function.html">https://www.gnu.org/software/make/manual/html_node/Wildcard-Function.html</a></p>
    <p>It looks like you need to move the .git directory out of the way
      before you build - or just modify the Makefile. And you shouldn't
      need to manually create ireallywantobuildon_linux.go, because the
      Makefile does it for you.<br>
    </p>
  </body>
</html>

--------------097ED90345A09D501DECC15C--

--===============4724465260195749307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4724465260195749307==--
