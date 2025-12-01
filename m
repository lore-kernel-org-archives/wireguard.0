Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBE2EF06E3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 17:13:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3a9c38f;
	Sun, 8 Feb 2026 17:10:30 +0000 (UTC)
Received: from newmail.megaweb.it (newmail.megaweb.it [2a0b:aa80::110])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f27202e8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Dec 2025 08:57:55 +0000 (UTC)
Received: from [192.168.7.14] (unknown [77.242.176.100])
 (Authenticated sender: cristiano.deana@drt.cittastudi.org)
 by newmail.megaweb.it (Postfix) with ESMTPSA id A35C0286989
 for <wireguard@lists.zx2c4.com>; Mon, 01 Dec 2025 09:57:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 newmail.megaweb.it A35C0286989
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=megaweb.it;
 s=default; t=1764579474;
 bh=4yVgareDAABvVt6DsVvRKP8yJiuscaF8EWHMT9zARtk=;
 h=Date:To:From:Subject;
 b=CcZIlI+VfVyMr3JJHzAvKDbRQT7FRxw9xNhXXe2f1IKg78IHsrz0sCPVw+XFGSOR0
 apefs3QRY2lJ//UgCyOIwwZH0m1rrwoX/UYUJ3xAofBYq82evJT3KaRiCN0sWqLZ1E
 yKYkqRl+p8ADR0jX5bedq1Y6xUwICb2p5c5K7cH0=
Message-ID: <b03a0aaf-1042-412c-9728-c679c658360d@megaweb.it>
Date: Mon, 1 Dec 2025 09:57:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wireguard@lists.zx2c4.com
Content-Language: it
From: Cristiano Deana <cristiano.deana@megaweb.it>
Subject: wg-quick: changes in freebsd
Autocrypt: addr=cristiano.deana@megaweb.it; keydata=
 xsDNBGZNlqkBDADSlSfXszJQv31Oik2XzZzMF2pqzvVa6eEIbY8VRYIYvyvEWOl9GmMttNBR
 ieJvOEm1QaXidTYao1oKLQWQUVvOKR81UMz7xf38J0XIuEZf/hlTvJC/7iJUVKGl3V+CcoL1
 5847Z8qN6tvjD44zmwtr8rAT4h8BfEkuf49gpn3DUT8N63qyyjl30k1YzB4nldAuydAyrGKM
 XeAkDLCIIKRkJLZw9Z5yX+ZW70xAx2iYFsXHEb1XUsL6W1LEohRuHxkLecB8lVVS1QEDsEl/
 QezQo9ix5w1hkCkymnVCp5cLoYlGqGKGlBCEGOiPoEOIP9cCwM9kWkJIbPyj3CAE2MWucVyo
 eaeU8CZSNv7dK9IxModjNM2XQRLytBJZooajQ4oiqwJciVr7Yvt210pEl2RJ4hZ1auTOv2eO
 jfE79phFcgjCDvMlz2qgn0E/ct0gAN5CBy0nlbVChDdq+KOTbC5htuHqM9C9pVvBcc9BV2vI
 UwgR90djJPDDQWdAUfiAUkEAEQEAAc0sQ3Jpc3RpYW5vIERlYW5hIDxjcmlzdGlhbm8uZGVh
 bmFAbWVnYXdlYi5pdD7CwQ0EEwEIADcWIQTWQVhYJdXh3CxmMIjqMwOUHWxXvAUCZk2WqgUJ
 CWYBgAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEOozA5QdbFe8kCUMAMVD3D5xulyzW95NWaX+
 +avqeAoZojlTlzl3jSIoeNS1AFB6O5Eh+hWyf0/kYDP3NqupGDwl8LOqPsnHbcWeDcrnbbDO
 mOedDSkbfhku3OZ5VQR1xEnRo0EJ6+NkX3gLqh7011HywNHkZdE0dUccis17Ktf+lH4PdHU/
 LIPrgay7gswWbJZ6jwKjH0VMRH66icAw5gQDWIQKbR60FPOq1BBILw0kk58D5WeopTljJXTc
 Ejszuw41KUR00HcctfarQ0lAKnwSdLlDNqiBrR4N5CYAwRWNdLSbqExuQe8tbxBbp3dhNXKL
 ojit82NGFb9o4DyCsucWOAvkGili1TR5I90ZsZDaoVimwWcd1mjf3aHQUJ8WsfintY3uBJvZ
 WLOeEjwDb+gsibDhbQcDboKNuflqWEUykbMe0fc8AN76PJ/P4UXW9X45fyypegIDPHWtH92U
 Ae9Tgc79bofxP9p1p3+EiKGSX2DpD6J1bh0V7u5wvAWnW5PDs6/1MUu+R8zA1c7AzQRmTZaq
 AQwA9nmOy3lxrUMhuxL8kUT6Iqj0Hifbwvwq4fsI0olErFfnVxHorLcXcsf7oNNByMQiNhJl
 LfcQH+vSJ5dhyyrfuY+oxENnBMC0wiq73FXBVlHdgLIrwhKlGB4dhVy8vBuEmlWBJqNABPEW
 2Nk6BE4xVmSO0Zu6YJz8x7XY5RL6xqjGL/7BxY4x2KWdHmlSOEqzmvGn46zBdBQ31gZp/6CC
 EaGmbZACzhytD+phb1YSewti0pCq+f1OuHecwQnfA7ubaLR3yBHZvZuJBBiLJ1pt0LeOyDv7
 r7GtuL0VQLBjTyFpmtwH2yDAO+T34j28B4O5KszACr4qSWe6risSj30jEo1WdTKPtAJkcj+P
 EgmP/sQyWuMT9TjAZaAiNzNt+znLDhsSIizsv++ZMAuNtFkmybwuM13ciF0Ja7KidhnqH3lJ
 b6IDc+nmyoZ351MO38jk1kTEsflpStEEI2uLPZHpgdHbDHEh2wZpYUOrzcX7uFKevjypIRd5
 cMwz7QKj+uTBABEBAAHCwPwEGAEIACYWIQTWQVhYJdXh3CxmMIjqMwOUHWxXvAUCZk2WqwUJ
 CWYBgAIbDAAKCRDqMwOUHWxXvNRIC/47ZL8K7gl/ayzcx+magSp7sT3pbNSK1VkfIQoJ4o9j
 eRQCueXdosstJY+gXBJYep7K3/1SJWR7r4Rx4diKbuvTtkgH2kiPf7cRM8KyNQgirzC6bNgY
 Z384WZFPDg1ID0ZZP0kXuwM/hvE+QpWRFVOnM5DDN3NZzADv07ARxgjXHB3BJlxRcG8REA/F
 Y2KYVd5DX1Vqhc+zXIFxJPT44Oaipi1156GkYdCzbRHcAw0kwI70XcWKDIz1xn8c65yYu62r
 pkl5SJBnGMF49NdM7ulfxt0YBQqrg2CZrjfxpJbCFMi34ZueRcOF9RCCYxUQefqJXmoneUAs
 P/sypyuzhuCyMh2Cb+GWKUag0Qi2IFKWRoy/wRmr6hVfEAlUn86/Lv1dfi+Jk9H+m2pKntIq
 TOz4Wah2SMkLrhwzbnqUeyXBIrurz3oEH3SXRhYBPBY18hY8ncPV9Br3CurSE6rR1J1t6MQf
 Q3lx5TBUM7DKhoZ5tB4XyQrGg+zDkb1kwa55t0Q=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:10:11 +0000
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

Hi,

in FreeBSD 15 `ifconfig' command required a specific netmask when assign 
an IP, but wg-quick extract (and save to .conf file) only the address, 
without mask.

I just wrote a little patch (that's not my job, maybe awful) to save 
$address/$mask to $INTERFACE.conf:

# diff freebsd.bash /usr/local/bin/wg-quick
347,348c347,349
<       { read -r _; while read -r _ _ _ address _; do
<               new_config+="Address = $address"$'\n'
---
 >       { read -r _; while read -r _ _ network address _; do
 >               mask=$(echo "$network" | awk -F / '{print $2}')
 >               new_config+="Address = $address/$mask"$'\n'

Feel free to point me the correct way to submit a patch request, thank you.

Cris

