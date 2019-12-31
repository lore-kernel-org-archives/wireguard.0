Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3067FC2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:41:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C724321734
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:41:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="z27gaMyT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C724321734
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df04f02e;
	Fri, 3 Jan 2020 15:39:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a61b6a96
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Dec 2019 19:24:04 +0000 (UTC)
Received: from st43p00im-ztbu10063601.me.com (st43p00im-ztbu10063601.me.com
 [17.58.63.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27adbe2c
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Dec 2019 19:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1577820243;
 bh=yD9/bDqtzu8AFWtBf/h5v1/svYV4EHc1vsView7a+tQ=;
 h=Subject:From:To:Message-ID:Date:Content-Type;
 b=z27gaMyT8YT8GMzMRkoPMtLzYD0ZvCYHlyq0C8wWtcr5O22vjT1XL1QUf3ZI3K2q1
 emk1ABK3u+QKcI7DrYXEfVBdWZT9glUzUGVvj7um4/gUNeqDm8g5p1oGE9XIrt2/mg
 S3A74jzYm4rTBN5EEtRGz4xIRYkNn1IhZkeKLE6lv3jaDiFOma0MED7yPXaerz+qxN
 6q4otPEN1xgDlnqAAxkBL4JCskWhyLug6Cp6i2IaqW7CTSRjcubU4Sqy0cm6+SOw0D
 W8f4LApuKhf9LLyKdkyIB11iITqKoXHHlpeYAeBbUhtyCc9zfMfDQ+OBGhr6OEurjR
 KmL6noiMVrosA==
Received: from [10.65.11.24] (unknown [185.206.227.140])
 by st43p00im-ztbu10063601.me.com (Postfix) with ESMTPSA id 332E970061C
 for <wireguard@lists.zx2c4.com>; Tue, 31 Dec 2019 19:24:03 +0000 (UTC)
Subject: Re: DNS fails after undetermined time in-tunnel
From: Lee Yates <rainmakerraw@icloud.com>
To: "WireGuard@lists.zx2c4.com" <WireGuard@lists.zx2c4.com>
References: <ef68748c-4b72-3287-781f-52cb93483de1@icloud.com>
Autocrypt: addr=rainmakerraw@icloud.com; keydata=
 mQENBFtSPGIBCACA1E2BjKjTOrhm43bkGwdwJHlgP04pimOFX3RrcA6YIg36mXvkCu8+q8we
 cTreZxGxVehb1VyQPkypI3k8UcfXWYm2t1uxGkiM/kCnUKsqBwJZXLxPM9erPIENwIf1hICc
 sPjEuMq2nIhYV8kfCOgwZKnbezy7kZ24edbVldz3dMniqiEeipkXWUr8y2UomYreGosFsLEN
 yj8RPFqYzCpvlFU9rT9wU5/+nwHtX1ySCmniR3MXurAWm6mAAJU9g/0dv5Ua8BCvvR/dadz4
 RGA7CmvOYL8qcn5A5djFMOqNqIp9IQOn9XNHR6+W8JzVwTpaz8xkbO/yr2kjhxn9uU5BABEB
 AAG0I0xlZSBZYXRlcyA8cmFpbm1ha2VycmF3QGljbG91ZC5jb20+iQE/BBABCAApAhsDAhkB
 FiEExF+G9PyiAB1cKHnz7yXLzDsoqZIFAl3R5D8FCQZCDt0ACgkQ7yXLzDsoqZK/dQf+NJnK
 46Pa3P0zzZhRHh+/J27nMtSfTTsdkboHbmSPVxiw9nlQ3xmFKEs9sqd4S4pWRVjpz+O/1O4L
 lMNJLc5Vt9ehhZ6UU5leoDU97NP6NCIEPwXOI8kZ58BzL7WPeqCaQFTXw2qcRwrBXUIYOJL2
 /pn23d5VMQRuJPbX1vQbVMQxyHmCNcTUl5bMmw1UsMcKT+fcvusIKLSS9gWQIn4Z0/HwNrwn
 2P8deKL0oREHgHni9z1l3ZBKlldf8jQv5p9+9RYYaTjHZEwed8QSqLSGLSeFonZvYRKyzY33
 GHOsg6QahjAgn30qKxy3s9E9i06OnSlFK1YaqijlpWImZeyZD7kBDQRbUjxkAQgAgEetirjP
 rK6Jd/XvXugGNAYE7TBSKkdzCEHkDpI+4RuooXSyk4vgCuYh42ophEMPuVBkja9kFnn0vCed
 2lt8TLC6lupCgifVfQe7VQeJ0N8qke25jk+k5ozkWuVap+PPVt4u6yItE2aO7Bqwl1p15v1J
 YJcr2LtPwEkCmIISpkcWgdWgj2QTwRjrKiJ3n6OxUDDdQiwNO2k9l4epuh0NfCghcfosN2K4
 YFZkGCoPMA07ByJfV8hFBxPGHBUeI990Q7bwb4q0+ktt91vOTkN0EzxDbYYwfAmDsida8HoV
 SLZFQuPZ4Sk6U64lSdQE1czzJ8dLPyT8yONHDeyEtLKIPQARAQABiQE8BBgBCAAmAhsMFiEE
 xF+G9PyiAB1cKHnz7yXLzDsoqZIFAl3R5D8FCQZCDtsACgkQ7yXLzDsoqZJzqAf/QWZh9Abw
 wrv/Bg9stqFNQ3E1H56h8p6upQENs3ZC3eOwOs4AHuhJcyQNpIjz/rEetxy1p+OH9Fohyaef
 rXF933/z1h1DC81wWi6DvuG9TdPEk/CnApnGF56ZJXp4JcxE7SMQQ1aUsodY7l9k3opl6hoT
 x0K1FtIT52lKAWf8cmoYFkiBfNyILtF3jv6ve/5ppmZo6/reNvFr9XML4odg1aoi19Jd/1HK
 /gzUP0i2z5B8r3PvJO6pdiNlmzPhBbCWdilFWkad++IEnDPymLYBGwRsawdBC0Tf62xpzGZ/
 +aqMGUhvXpzfqiYc+G0oXzgt1J46RjN+mb8fTQPl/jTFqA==
Message-ID: <eae1d28d-bcf2-8e42-93e9-2b6c5879e28c@icloud.com>
Date: Tue, 31 Dec 2019 19:24:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <ef68748c-4b72-3287-781f-52cb93483de1@icloud.com>
Content-Language: en-GB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-12-31_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1912310166
X-Mailman-Approved-At: Fri, 03 Jan 2020 16:39:50 +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Further to the below, I have discovered after sending the original
message (typical!) that resolvconf doesn't appear to be being called
correctly, at least on Void.

> resolvconf -a mullvad -m -0 -x
> No file given via stdin

The DNS entry in /etc/resolv.conf stays at the original system DNS and
isn't changed to reflect the WireGuard .conf file.

However after noticing this and issuing 'resolvconf -u' manually once
the tunnel is up, openresolv/resolvconf correctly updates
/etc/resolv.conf with the tunnel's supposed DNS (from the .conf).

> $ sudo resolvconf -u
> $ sudo cat /etc/resolv.conf
> # Generated by resolvconf
> nameserver 193.138.218.74

As I said in my first message, this isn't Void Linux specific and people
(including me) are experiencing the same issue on systemd based systems,
but hopefully it's a useful pointer. Again, I hope this is helpful.

Best wishes,

Lee Yates


On 31/12/2019 18:49, Lee Yates wrote:
> Hi,
> 
> I hope everyone had an enjoyable festive period.
> 
> I have posted this issue on the /r/WireGuard subreddit, and several
> Linux people responded that they are also experiencing it. As such I'm
> posting here 'properly'.
> 
> For a while now, I have noticed that a WG tunnel on my Linux machines
> will at some point lose DNS. It doesn't matter what the DNS was set to
> in the .conf (i.e. VPN provider's own, my own local resolver on a Pi,
> Cloudflare, whatever) - after a seemingly arbitrary time DNS will just
> stop working whether in a browser, CLI or elsewhere. For example:
> 
>> $ update
>> Password: 
>> [*] Updating `https://alpha.de.repo.voidlinux.org/current/x86_64-repodata' ...
>> ERROR: [reposync] failed to fetch file `https://alpha.de.repo.voidlinux.org/current/x86_64-repodata': Transient resolver failure
> 
> Only taking down the tunnel and bringing it back up will resolve the
> issue, at least until it recurs again a short while later. Curiously
> though, wg-quick reports that there's no such process during the
> take-down, but it does nonetheless disconnect it. Reconnecting does, as
> I said, work fine for a while again.
> 
>> $ sudo cat /etc/resolv.conf
>> nameserver 192.168.2.12
> 
>> $ wg-quick down mullvad
>> [#] ip -4 rule delete table 51820
>> [#] ip -4 rule delete table main suppress_prefixlength 0
>> [#] ip -6 rule delete table 51820
>> [#] ip -6 rule delete table main suppress_prefixlength 0
>> [#] ip link delete dev mullvad
>> [#] resolvconf -d mullvad -f
>> [#] iptables-restore -n
>> [#] ip6tables-restore -n
>> [#] ip route del 192.168.2.0/24 via 192.168.1.1
>> RTNETLINK answers: No such process
> 
> I am currently in Void Linux with WireGuard version 20191219 (the latest
> in the repo). Void has openresolv (3.9.2_1) installed also, by default.
> Because Void uses runit rather then systemd, there's no access to the
> wg-quick@ system service. As such I am bringing up and taking down the
> connection manually with wg-quick up/down. However I get the same
> behaviour on Ubuntu 19.10, Arch Linux and Fedora 31 which all use
> systemd and the related wg-quick@ service (and resolvconf instead of
> openresolv).
> 
> I have also tried adding a PersistentKeepalive = 25 to my .conf with no
> effect either way. My home router is actually a repurposed Dell Optiplex
> Core i7 x64 machine with Arch Linux installed, and WireGuard has never
> needed NAT keepalive on my network before (nor did enabling it change
> this DNS drop behaviour). Finally, I have tried several WireGuard
> providers including Mullvad, TunSafe, AzireVPN and a manual VPS install
> - all have the same DNS failure after a short while.
> 
> I don't know how to start debugging this, but hopefully I've provided
> enough to help someone get an idea (or provide me further steps to help).
> 
> Best wishes,
> 
> Lee Yates
> 
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
