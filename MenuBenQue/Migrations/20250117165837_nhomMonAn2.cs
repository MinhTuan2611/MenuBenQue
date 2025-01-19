using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MenuBenQue.Migrations
{
    public partial class nhomMonAn2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Combos_NhomMonAn_NhomMonNhomId",
                table: "Combos");

            migrationBuilder.AddColumn<int>(
                name: "NhomMonAn2NhomId",
                table: "MonAns",
                type: "int",
                nullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "NhomMonNhomId",
                table: "Combos",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.CreateIndex(
                name: "IX_MonAns_NhomMonAn2NhomId",
                table: "MonAns",
                column: "NhomMonAn2NhomId");

            migrationBuilder.AddForeignKey(
                name: "FK_Combos_NhomMonAn_NhomMonNhomId",
                table: "Combos",
                column: "NhomMonNhomId",
                principalTable: "NhomMonAn",
                principalColumn: "NhomId");

            migrationBuilder.AddForeignKey(
                name: "FK_MonAns_NhomMonAn_NhomMonAn2NhomId",
                table: "MonAns",
                column: "NhomMonAn2NhomId",
                principalTable: "NhomMonAn",
                principalColumn: "NhomId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Combos_NhomMonAn_NhomMonNhomId",
                table: "Combos");

            migrationBuilder.DropForeignKey(
                name: "FK_MonAns_NhomMonAn_NhomMonAn2NhomId",
                table: "MonAns");

            migrationBuilder.DropIndex(
                name: "IX_MonAns_NhomMonAn2NhomId",
                table: "MonAns");

            migrationBuilder.DropColumn(
                name: "NhomMonAn2NhomId",
                table: "MonAns");

            migrationBuilder.AlterColumn<int>(
                name: "NhomMonNhomId",
                table: "Combos",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Combos_NhomMonAn_NhomMonNhomId",
                table: "Combos",
                column: "NhomMonNhomId",
                principalTable: "NhomMonAn",
                principalColumn: "NhomId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
